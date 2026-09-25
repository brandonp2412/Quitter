#!/usr/bin/env python3
"""Materialize localized Google Play changelogs from canonical translations."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ASSET_CHANGELOGS = ROOT / "assets" / "changelogs"
PLAY_METADATA = ROOT / "fastlane" / "metadata" / "android"
STORE_LOCALES = {
    "de": "de-DE",
    "es": "es-ES",
    "fr": "fr-FR",
    "ja": "ja-JP",
    "ru": "ru-RU",
    "zh": "zh-CN",
}


def normalize(value: str) -> str:
    """Normalize whitespace so equivalent release notes map reliably."""
    return re.sub(r"\s+", " ", value).strip()


def load_json(path: Path) -> dict[str, object]:
    """Load a JSON object from disk."""
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> int:
    """Synchronize or validate localized Play changelog coverage."""
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--check",
        action="store_true",
        help="Validate coverage without writing generated changelog files.",
    )
    args = parser.parse_args()

    normalized_asset_keys: dict[str, str] = {}
    for path in ASSET_CHANGELOGS.glob("*.txt"):
        text = path.read_text(encoding="utf-8").strip()
        normalized_asset_keys[normalize(text)] = path.stem

    localized_assets = {
        locale: load_json(ASSET_CHANGELOGS / f"{locale}.json")
        for locale in STORE_LOCALES
    }
    play_overrides = load_json(ASSET_CHANGELOGS / "play_overrides.json")

    english_play_dir = PLAY_METADATA / "en-US" / "changelogs"
    english_play_files = sorted(
        english_play_dir.glob("*.txt"),
        key=lambda path: (
            0 if path.stem.isdigit() else 1,
            int(path.stem) if path.stem.isdigit() else path.stem,
        ),
    )

    missing: list[str] = []
    generated = 0
    reused = 0
    empty = 0

    for english_path in english_play_files:
        version_code = english_path.stem
        english_text = english_path.read_text(encoding="utf-8").strip()
        if not english_text:
            empty += 1
            continue

        asset_key = normalized_asset_keys.get(normalize(english_text))
        override_entry = play_overrides.get(version_code, {})
        if not isinstance(override_entry, dict):
            raise ValueError(
                f"play_overrides.json entry {version_code} must be an object"
            )

        for locale, store_locale in STORE_LOCALES.items():
            target = PLAY_METADATA / store_locale / "changelogs" / english_path.name
            translated: str | None = None

            if asset_key is not None:
                candidate = localized_assets[locale].get(asset_key)
                if isinstance(candidate, str) and candidate.strip():
                    translated = candidate.strip()

            if translated is None:
                candidate = override_entry.get(locale)
                if isinstance(candidate, str) and candidate.strip():
                    translated = candidate.strip()

            if translated is None and target.exists():
                candidate = target.read_text(encoding="utf-8").strip()
                if candidate and normalize(candidate) != normalize(english_text):
                    translated = candidate
                    reused += 1

            if translated is None:
                missing.append(f"{version_code}:{locale}")
                continue

            if normalize(translated) == normalize(english_text):
                missing.append(f"{version_code}:{locale} (English fallback)")
                continue

            if args.check:
                if not target.exists():
                    missing.append(f"{version_code}:{locale} (not synchronized)")
                    continue
                existing = target.read_text(encoding="utf-8").strip()
                if normalize(existing) != normalize(translated):
                    missing.append(f"{version_code}:{locale} (stale)")
                continue

            target.parent.mkdir(parents=True, exist_ok=True)
            existing = target.read_text(encoding="utf-8").strip() if target.exists() else None
            if existing == translated:
                continue
            target.write_text(f"{translated}\n", encoding="utf-8")
            generated += 1

    if missing:
        print("Missing localized Play changelogs:")
        for item in missing:
            print(f"  {item}")
        if args.check:
            return 1

    action = "validated" if args.check else "synchronized"
    print(
        f"{action} {len(english_play_files) - empty} non-empty Play changelogs "
        f"across {len(STORE_LOCALES)} locales; "
        f"{empty} empty English notes skipped, {generated} files updated, "
        f"{reused} existing manual translations reused."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
