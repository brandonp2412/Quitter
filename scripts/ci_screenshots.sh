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

device="emulator-$EMULATOR_PORT"
screenshot_dir="fastlane/metadata/android/en-US/images/$QUITTER_DEVICE_TYPE"

wait_for_emulator() {
  timeout 60 adb -s "$device" wait-for-device >/dev/null 2>&1 || return 1

  checks=0
  while [ "$checks" -lt 30 ]; do
    state=$(adb -s "$device" get-state 2>/dev/null || true)
    boot_completed=$(adb -s "$device" shell getprop sys.boot_completed 2>/dev/null | tr -d '\r' || true)
    if [ "$state" = "device" ] && [ "$boot_completed" = "1" ]; then
      return 0
    fi
    sleep 2
    checks=$((checks + 1))
  done

  return 1
}

recover_emulator() {
  echo "Recovering emulator transport before retry" >&2
  adb kill-server >/dev/null 2>&1 || true
  adb start-server >/dev/null 2>&1 || true
  adb reconnect offline >/dev/null 2>&1 || true
  wait_for_emulator
}

collect_diagnostics() {
  adb -s "$device" logcat -d -t 300 >&2 || true
  adb -s "$device" shell dumpsys activity top >&2 || true
  adb -s "$device" shell ps -A >&2 || true
}

if ! wait_for_emulator; then
  recover_emulator || {
    echo "Emulator did not become ready" >&2
    collect_diagnostics
    exit 1
  }
fi

if [ -n "${SCREENSHOT_SCREEN_SIZE:-}" ]; then
  adb -s "$device" shell wm size "$SCREENSHOT_SCREEN_SIZE"
  expected_dimensions=$(printf '%s' "$SCREENSHOT_SCREEN_SIZE" | sed 's/x/ x /')
fi

screenshots_complete() {
  for number in $(seq 1 8); do
    [ -s "$screenshot_dir/${number}_en-US.png" ] || return 1
  done
  return 0
}

drive_log=$(mktemp)
drive_status=0
attempt=1

while :; do
  rm -rf "$screenshot_dir"
  mkdir -p "$screenshot_dir"
  drive_status=0

  timeout --foreground -k 30 570 flutter drive --profile \
    --driver=test_driver/integration_test.dart \
    --target=integration_test/screenshot_test.dart \
    --dart-define="QUITTER_DEVICE_TYPE=$QUITTER_DEVICE_TYPE" \
    -d "$device" >"$drive_log" 2>&1 || drive_status=$?

  cat "$drive_log"

  if screenshots_complete && { [ "$drive_status" -eq 0 ] || grep -q "All tests passed!" "$drive_log"; }; then
    break
  fi

  transient_failure=0
  if [ "$drive_status" -eq 124 ] || grep -Eiq \
    'device offline|Connection reset|Service has disappeared|VMServiceFlutterDriver: It is taking an unusually long time to connect' \
    "$drive_log"; then
    transient_failure=1
  elif grep -q "All tests passed!" "$drive_log" && ! screenshots_complete; then
    transient_failure=1
  fi

  if [ "$transient_failure" -ne 1 ] || [ "$attempt" -ge 2 ]; then
    collect_diagnostics
    break
  fi

  echo "Transient emulator failure on screenshot attempt $attempt; retrying once" >&2
  collect_diagnostics
  recover_emulator || break
  attempt=$((attempt + 1))
  drive_log=$(mktemp)
done

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

screenshot_count=$(find "$screenshot_dir" -maxdepth 1 -type f -name '*.png' | wc -l | tr -d ' ')
if [ "$screenshot_count" -ne 8 ]; then
  echo "Expected exactly 8 Google Play screenshots, found $screenshot_count" >&2
  exit 1
fi

if [ "$drive_status" -ne 0 ]; then
  if ! grep -q "All tests passed!" "$drive_log"; then
    exit "$drive_status"
  fi
  echo "flutter drive lost the emulator during teardown after all screenshots were generated"
fi
