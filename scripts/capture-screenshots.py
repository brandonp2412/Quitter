#!/usr/bin/env python3
import argparse, asyncio, functools, html, http.server, json, threading, shutil, struct, tempfile
from pathlib import Path
from patchright.async_api import async_playwright
from screenshot_status_bar import STATUS_BAR_HEIGHT, capture_with_status_bar

LOCALES = {"en": "en-US", "ar": "ar", "de": "de-DE", "es": "es-ES",
           "fa": "fa", "fr": "fr-FR", "id": "id", "ja": "ja-JP",
           "ko": "ko-KR", "pl": "pl-PL", "pt": "pt-PT", "pt-BR": "pt-BR",
           "ru": "ru-RU", "th": "th", "ur": "ur", "zh": "zh-CN", "zh-Hant": "zh-TW"}

def expected_names(locale):
    return {f"{n}_{LOCALES[locale]}.png" for n in range(1, 9)}
FULL_NAMES = {f"full-{name}.png" for name in (
    "home-dark",
    "home-light",
    "home-search",
    "home-search-empty",
    "add-journey",
    "add-journey-search",
    "add-journey-empty",
    "custom-create",
    "custom-edit",
    "custom-delete-confirmation",
    "custom-date-picker",
    "custom-journey",
    "preset-edit",
    "stats",
    "money-saved-settings",
    "time-saved-settings",
    "journal-filled",
    "settings-dark",
    "settings-light",
    "settings-security",
    "settings-notifications",
    "settings-system",
    "settings-search-empty",
    "settings-language-dialog",
    "settings-notification-dialog",
    "settings-pin-dialog",
    "settings-delete-confirmation",
    "milestone-reference",
    "about",
    "whats-new",
    "enjoying-app",
    "pin-lock",
    "smoking-date-picker",
    "preset-adderall",
    "preset-alcohol",
    "preset-benzodiazepine",
    "preset-cocaine",
    "preset-gabapentinoids",
    "preset-ghb",
    "preset-inhalants",
    "preset-ketamine",
    "preset-kratom",
    "preset-maoi",
    "preset-marijuana",
    "preset-mdma",
    "preset-meth",
    "preset-nicotine-pouches",
    "preset-nitrous-oxide",
    "preset-opioid",
    "preset-pornography",
    "preset-smokeless-tobacco",
    "preset-smoking",
    "preset-snri",
    "preset-social-media",
    "preset-ssri",
    "preset-steroids",
    "preset-synthetic-cannabinoids",
    "preset-tca",
    "preset-vaping",
    "journey-smoking",
    "journey-vaping",
    "journey-alcohol",
    "journey-marijuana",
    "preset-heroin",
    "preset-fentanyl",
    "home-empty",
    "stats-empty",
)}
MAX_BYTES = 8 * 1024 * 1024

PROFILES = {
    "phoneScreenshots": (450, 800, 2.4),
    "sevenInchScreenshots": (1440, 810, 4/3),
    "tenInchScreenshots": (1280, 800, 2),
    "desktop": (1600, 881, 1),
}

def validate_screenshot(path, expected):
    with path.open("rb") as source:
        header = source.read(26)
    if header[:8] != b"\x89PNG\r\n\x1a\n" or len(header) != 26:
        raise ValueError(f"Invalid PNG: {path}")
    if struct.unpack(">II", header[16:24]) != expected:
        raise ValueError(f"Unexpected dimensions: {path}")
    if header[24:26] != bytes((8, 2)) or path.stat().st_size > MAX_BYTES:
        raise ValueError(f"Invalid RGB PNG or file size: {path}")


async def request(page, message=None):
    command = {"command": "request_data"}
    if message is not None:
        command["message"] = message
    await page.evaluate("command => { window.$flutterDriver(JSON.stringify(command)); }", command, isolated_context=False)
    await page.wait_for_function("window.$flutterDriverResult != null", timeout=90000)
    result = await page.evaluate("() => {const r = window.$flutterDriverResult; window.$flutterDriverResult = null; return r;}", isolated_context=False)
    response = json.loads(result)
    if response.get("isError"):
        raise RuntimeError(response)
    return json.loads(response["response"]["message"])

async def capture(browser, url, out, name, debug_dir, locale, full):
    EXPECTED_NAMES = FULL_NAMES if full else expected_names(locale)
    w,h,scale = PROFILES[name]
    status_bar = name != "desktop"
    options = dict(viewport={"width":w,"height":h - STATUS_BAR_HEIGHT if status_bar else h}, device_scale_factor=scale, reduced_motion="reduce", locale="en-US", timezone_id="UTC")
    if name == "phoneScreenshots":
        options.update(is_mobile=True, has_touch=True, user_agent="Mozilla/5.0 (Linux; Android 15; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36")
    context=await browser.new_context(**options)
    dest=out/name
    dest.mkdir(parents=True,exist_ok=True)
    page=await context.new_page()
    compositor_context = await browser.new_context(viewport={"width": round(w * scale), "height": round(h * scale)}, device_scale_factor=1) if status_bar else None
    compositor = await compositor_context.new_page() if compositor_context else None
    page.on("console", lambda msg: print(name, msg.type, msg.text[:500], flush=True) if msg.type in ("error","warning") or "EXCEPTION" in msg.text or "Exception" in msg.text or "Error" in msg.text else None)
    errors = []
    page.on("pageerror", lambda e: errors.append(str(e)))
    try:
        await page.goto(url + "?locale=" + locale + ("&gallery=full" if full else ""), wait_until="domcontentloaded")
        await page.wait_for_function("typeof window.$flutterDriver === 'function'",timeout=90000)
        print(name, "viewport",await page.evaluate("() => [innerWidth,innerHeight,devicePixelRatio]"),flush=True)
        response=await request(page,"pending")
        captured = set()
        while True:
            data=response.get("data") or {}
            command=data.get("web_driver_command")
            if command=="WebDriverCommandType.screenshot":
                filename=data["screenshot_name"]+".png"
                if filename not in EXPECTED_NAMES or filename in captured:
                    raise RuntimeError(f"Unexpected screenshot: {filename}")
                await page.wait_for_timeout(500)
                if compositor:
                    await capture_with_status_bar(page, compositor, dest/filename, w, h, scale)
                else:
                    await page.screenshot(path=str(dest/filename), animations="disabled", scale="device")
                validate_screenshot(dest/filename, (round(w*scale), round(h*scale)))
                captured.add(filename)
                print(name,filename,flush=True)
                response=await request(page,"complete")
            elif command=="WebDriverCommandType.ack":
                response=await request(page,"pending")
            elif command=="WebDriverCommandType.noop":
                result=await request(page)
                print(name,"RESULT",json.dumps(result)[:5000],flush=True)
                if captured != EXPECTED_NAMES or result.get("result") != "true" or errors:
                    raise RuntimeError(f"{name}: captured={captured}, result={result}, page errors={errors}")
                return
            else:
                raise RuntimeError(response)
    except Exception:
        shutil.copytree(dest, debug_dir / "failed" / ("full" if full else "store") / name, dirs_exist_ok=True)
        await page.screenshot(path=str(debug_dir / f"{name}-debug.png"))
        raise
    finally:
        await context.close()
        if compositor_context:
            await compositor_context.close()

STORE_NAMES = (
    "home", "alcohol", "smoking", "custom-edit-store", "home-actions",
    "marijuana", "settings", "journal",
)

PROFILE_LABELS = {
    "phoneScreenshots": "Phone",
    "sevenInchScreenshots": "7-inch tablet",
    "tenInchScreenshots": "10-inch tablet",
    "desktop": "Desktop",
}


def build_gallery(captures, destination):
    entries = {}
    for profile in PROFILES:
        files = [
            (captures / profile / f"{number}_en-US.png", f"{number:02}-{name}.png")
            for number, name in enumerate(STORE_NAMES, 1)
        ] + [
            (captures / "full" / profile / name, name.removeprefix("full-"))
            for name in sorted(FULL_NAMES)
        ]
        w, h, scale = PROFILES[profile]
        for source, name in files:
            validate_screenshot(source, (round(w * scale), round(h * scale)))
        entries[profile] = files

    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=destination.parent, prefix=".gallery-") as temp:
        gallery = Path(temp) / "gallery"
        gallery.mkdir()
        root = ["# Quitter screenshot gallery", "",
                "Generated from the automated screenshot fixture with sample data.", "",
                f"{sum(map(len, entries.values()))} screenshots across {len(entries)} device profiles.", ""]
        sections = []
        for profile, files in entries.items():
            label = PROFILE_LABELS[profile]
            root.append(f"- [{label} — {len(files)} screenshots]({profile}/)")
            directory = gallery / profile
            directory.mkdir()
            markdown = [f"# {label}", "", "[All device profiles](../)", ""]
            cards = []
            w, h, scale = PROFILES[profile]
            image_width, image_height = round(w * scale), round(h * scale)
            for source, filename in files:
                shutil.copyfile(source, directory / filename)
                title = filename.removesuffix(".png")
                if title[:2].isdigit():
                    title = title[3:]
                title = title.replace("-", " ").capitalize()
                width = 260 if profile == "phoneScreenshots" else 480
                markdown.extend([f"### {title}", "", f'<a href="{filename}"><img src="{filename}" alt="{title}" width="{width}"/></a>', ""])
                path = f"{profile}/{filename}"
                cards.append(f'<a href="{path}"><img loading="lazy" src="{path}" width="{image_width}" height="{image_height}" alt="{html.escape(title)}"><span>{html.escape(title)}</span></a>')
            (directory / "README.md").write_text("\n".join(markdown), encoding="utf-8")
            sections.append(f'<section id="{profile}"><h2>{label} · {len(files)} screenshots</h2><div class="screens {profile}">{"".join(cards)}</div></section>')
        (gallery / "README.md").write_text("\n".join(root) + "\n", encoding="utf-8")
        links = " ".join(f'<a href="#{profile}">{label}</a>' for profile, label in PROFILE_LABELS.items())
        (gallery / "index.html").write_text(
            '<!doctype html><html lang="en"><meta charset="utf-8">'
            '<meta name="viewport" content="width=device-width,initial-scale=1">'
            '<title>Quitter screenshots</title><style>'
            'body{font:16px system-ui;margin:24px;background:#17161b;color:#eee}'
            'nav{display:flex;gap:20px;flex-wrap:wrap;position:sticky;top:0;z-index:1;background:#17161b;padding:12px 0}'
            'a{color:#d3bfff;text-decoration:none}.screens{display:grid;grid-template-columns:repeat(auto-fill,minmax(360px,1fr));gap:16px}'
            '.phoneScreenshots{grid-template-columns:repeat(auto-fill,minmax(200px,1fr))}'
            '.screens a{display:flex;flex-direction:column;gap:8px;background:#25242b;border-radius:12px;padding:12px}'
            'img{display:block;width:100%;height:auto;object-fit:contain;border-radius:5px;background:#17161b}section{scroll-margin-top:calc(var(--nav-height, 65px) + 12px)}'
            '@media(max-width:500px){.screens,.phoneScreenshots{grid-template-columns:1fr}}'
            '</style><h1>Quitter screenshots</h1><p>All device profiles · Sample data · Click any image for full resolution</p>'
            f'<nav>{links}</nav>{"".join(sections)}<script>const nav=document.querySelector("nav");const resize=()=>document.documentElement.style.setProperty("--nav-height",nav.offsetHeight+"px");resize();new ResizeObserver(resize).observe(nav);</script></html>',
            encoding="utf-8",
        )
        if destination.exists():
            shutil.rmtree(destination)
        gallery.rename(destination)


async def main(args):
    args.output.mkdir(parents=True, exist_ok=True)
    handler=functools.partial(http.server.SimpleHTTPRequestHandler,directory=str(args.web))
    server=http.server.ThreadingHTTPServer(("127.0.0.1",0),handler)
    threading.Thread(target=server.serve_forever,daemon=True).start()
    try:
        with tempfile.TemporaryDirectory(prefix="quitter-screenshots-") as directory:
            staged = Path(directory)
            async with async_playwright() as p:
                browser = await p.chromium.launch(
                    headless=True, args=["--no-sandbox", "--disable-dev-shm-usage"]
                )
                try:
                    for name in args.profiles:
                        await capture(browser, f"http://127.0.0.1:{server.server_port}/", staged, name, args.output, args.locale, args.full)
                finally:
                    await browser.close()
            for name in args.profiles:
                destination = args.output / "full" / name if args.full else args.output / name
                destination.mkdir(parents=True, exist_ok=True)
                for filename in sorted(FULL_NAMES if args.full else expected_names(args.locale)):
                    shutil.copyfile(staged / name / filename, destination / filename)
            if args.gallery:
                build_gallery(args.output, args.gallery)
    finally:
        server.shutdown()
        server.server_close()
if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--full", action="store_true")
    parser.add_argument("--gallery", type=Path)
    parser.add_argument("--web",type=Path,required=True)
    parser.add_argument("--output",type=Path,required=True)
    parser.add_argument("--locale", choices=LOCALES, default="en")
    parser.add_argument("profiles",nargs="*",default=None)
    args = parser.parse_args()
    if not args.profiles:
        args.profiles = list(PROFILES) if args.full else [name for name in PROFILES if name != "desktop"]
    if args.gallery and (not args.full or args.locale != "en"):
        parser.error("--gallery requires English --full capture")
    if any(name not in PROFILES for name in args.profiles):
        parser.error("Unknown screenshot profile")
    asyncio.run(main(args))
