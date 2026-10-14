#!/usr/bin/env bash
set -euo pipefail
: "$SCREENSHOT_LOCALES"
: "$QUITTER_DEVICE_TYPE"
for locale in $SCREENSHOT_LOCALES; do
  echo "::group::$QUITTER_DEVICE_TYPE / $locale"
  QUITTER_LOCALE="$locale" ./scripts/ci_screenshots.sh
  echo "::endgroup::"
done
