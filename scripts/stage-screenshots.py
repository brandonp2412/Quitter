"""Stage all localized store screenshot files under the existing artifact contract."""
import argparse
import importlib.util
from pathlib import Path
import shutil

spec = importlib.util.spec_from_file_location("capture", Path(__file__).with_name("capture-screenshots.py"))
capture = importlib.util.module_from_spec(spec)
spec.loader.exec_module(capture)

parser = argparse.ArgumentParser()
parser.add_argument("source", type=Path)
parser.add_argument("destination", type=Path)
args = parser.parse_args()
for locale, store_locale in capture.LOCALES.items():
    for profile, (width, height, scale) in capture.PROFILES.items():
        source = args.source / locale / profile
        if {path.name for path in source.glob("*.png")} != capture.expected_names(locale):
            raise ValueError(f"Incomplete localized screenshots: {locale}/{profile}")
        target = args.destination / store_locale / "images" / profile
        target.mkdir(parents=True, exist_ok=True)
        for path in source.glob("*.png"):
            capture.validate_screenshot(path, (round(width * scale), round(height * scale)))
            shutil.copyfile(path, target / path.name)
