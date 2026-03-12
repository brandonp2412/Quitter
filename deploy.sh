#!/bin/bash

set -ex

# Calculate new version
current_version=$(yq e '.version' pubspec.yaml)
IFS='+.' read -r major minor patch build_number <<< "$current_version"

new_patch=$((patch + 1))
new_build_number=$((build_number + 1))
changelog_number=$((new_build_number * 10 + 3))
new_flutter_version="$major.$minor.$new_patch+$new_build_number"
new_version="$major.$minor.$new_patch"

current_msix_version=$(yq e '.msix_config.msix_version' pubspec.yaml)
IFS='.' read -r msix_major msix_minor msix_patch msix_zero <<< "$current_msix_version"
new_msix_version="$msix_major.$msix_minor.$((msix_patch + 1)).$msix_zero"

echo "New version: $new_flutter_version, MSIX: $new_msix_version, Changelog: $changelog_number"

# Generate changelog
changelog_file="fastlane/metadata/android/en-US/changelogs/$changelog_number.txt"

if [ ! -f "$changelog_file" ]; then
  mkdir -p "$(dirname "$changelog_file")"
  last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
  git --no-pager log --pretty=format:'%s' "$last_tag"..HEAD |
    sort -u |
    grep -v "^Merge \|^Release \|^Bump \|^Update \|^[0-9]\+\.[0-9]\+\.[0-9]\+" |
    head -10 |
    sed 's/^/• /' >"$changelog_file"
  nvim "$changelog_file"
fi

mkdir -p fastlane/metadata/en-AU
cat "$changelog_file" >fastlane/metadata/en-AU/release_notes.txt

# Setup Flutter
git submodule update --init --recursive flutter
export PATH="$PWD/flutter/bin:$PATH"

# Tests and analysis
flutter test
dart analyze lib
dart format --set-exit-if-changed lib

# Update versions
yq e ".version |= \"$new_flutter_version\"" -i pubspec.yaml
yq e ".msix_config.msix_version |= \"$new_msix_version\"" -i pubspec.yaml

# Copy changelogs with timestamps
mkdir -p assets/changelogs
for file in fastlane/metadata/android/en-US/changelogs/*.txt; do
  [ -f "$file" ] || continue
  if [[ "$OSTYPE" == "darwin"* ]]; then
    timestamp=$(stat -f "%B" "$file")
  else
    timestamp=$(stat --format="%W" "$file")
  fi
  cp "$file" "assets/changelogs/$timestamp.txt"
done

generate_screenshots() {
  local avd_name=$1
  emulator -avd "$avd_name" -no-window -gpu swiftshader_indirect -noaudio -no-boot-anim -camera-back none &
  emulator_pid=$!

  timeout=300
  elapsed=0
  emulator_id=""
  while [ $elapsed -lt $timeout ]; do
    emulator_id=$(adb devices | grep "emulator-" | grep "device$" | awk '{print $1}' | head -1)
    [ -n "$emulator_id" ] && break
    kill -0 "$emulator_pid" 2>/dev/null || exit 1
    sleep 5
    elapsed=$((elapsed + 5))
  done

  [ -n "$emulator_id" ] || { kill $emulator_pid 2>/dev/null || true; exit 1; }

  sleep 15
  flutter drive --profile --driver=test_driver/integration_test.dart \
    --dart-define=QUITTER_DEVICE_TYPE=$avd_name \
    --target=integration_test/screenshot_test.dart -d "$emulator_id"

  adb -s "$emulator_id" emu kill 2>/dev/null || kill $emulator_pid 2>/dev/null || true
  sleep 5
}

if [[ "$*" == *"-n"* ]]; then
  echo "Skipping screenshots"
else
  generate_screenshots "phoneScreenshots"
  generate_screenshots "sevenInchScreenshots"
  generate_screenshots "tenInchScreenshots"
fi

# Commit and tag
if ! git diff --quiet HEAD -- pubspec.yaml fastlane/metadata pubspec.lock assets; then
  git add pubspec.yaml fastlane/metadata pubspec.lock assets
  git commit -m "Release $new_version"
  git tag "$new_version"
fi

# Build
[[ "$OSTYPE" == "darwin"* ]] && flutter build macos
[[ "$OSTYPE" == "linux-gnu"* ]] && flutter build linux
[[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]] && flutter build windows
flutter config --enable-web
flutter build web --release

git push
git push --tags
