#!/bin/sh

set -u

if [ -z "${QUITTER_DEVICE_TYPE:-}" ]; then
  echo "QUITTER_DEVICE_TYPE must be set" >&2
  exit 1
fi

if [ -z "${EMULATOR_PORT:-}" ]; then
  echo "EMULATOR_PORT must be set" >&2
  exit 1
fi

screenshot_dir="fastlane/metadata/android/en-US/images/$QUITTER_DEVICE_TYPE"
rm -rf "$screenshot_dir"
mkdir -p "$screenshot_dir"

if [ -n "${SCREENSHOT_SCREEN_SIZE:-}" ]; then
  adb -s "emulator-$EMULATOR_PORT" shell wm size "$SCREENSHOT_SCREEN_SIZE"
  expected_dimensions=$(printf '%s' "$SCREENSHOT_SCREEN_SIZE" | sed 's/x/ x /')
fi

drive_log=$(mktemp)
drive_status=0
flutter drive --profile \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/screenshot_test.dart \
  --dart-define="QUITTER_DEVICE_TYPE=$QUITTER_DEVICE_TYPE" \
  -d "emulator-$EMULATOR_PORT" >"$drive_log" 2>&1 || drive_status=$?
cat "$drive_log"

for number in $(seq 1 8); do
  if [ ! -s "$screenshot_dir/${number}_en-US.png" ]; then
    echo "Missing generated screenshot: ${number}_en-US.png" >&2
    [ "$drive_status" -ne 0 ] && exit "$drive_status"
    exit 1
  fi
  if [ -n "${SCREENSHOT_SCREEN_SIZE:-}" ] && ! file "$screenshot_dir/${number}_en-US.png" | grep -Fq " $expected_dimensions,"; then
    echo "Screenshot has unexpected dimensions: $(file "$screenshot_dir/${number}_en-US.png")" >&2
    exit 1
  fi
done

if [ "$drive_status" -ne 0 ]; then
  if ! grep -q "All tests passed!" "$drive_log"; then
    exit "$drive_status"
  fi
  echo "flutter drive lost the emulator during teardown after all screenshots were generated"
fi
