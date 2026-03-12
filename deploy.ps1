#!/usr/bin/env pwsh

$ErrorActionPreference = "Stop"
$PSNativeCommandErrorActionPreference = "Stop"
Set-PSDebug -Trace 1

# Calculate new version
$currentVersion = yq e '.version' pubspec.yaml
$parts = $currentVersion -split '[+\.]'
$major, $minor, $patch, $buildNumber = $parts[0], $parts[1], [int]$parts[2], [int]$parts[3]

$newPatch = $patch + 1
$newBuildNumber = $buildNumber + 1
$changelogNumber = $newBuildNumber * 10 + 3
$newFlutterVersion = "$major.$minor.$newPatch+$newBuildNumber"
$newVersion = "$major.$minor.$newPatch"

$mp = (yq e '.msix_config.msix_version' pubspec.yaml) -split '\.'
$newMsixVersion = "$($mp[0]).$($mp[1]).$([int]$mp[2] + 1).$($mp[3])"

Write-Host "New version: $newFlutterVersion, MSIX: $newMsixVersion, Changelog: $changelogNumber"

# Generate changelog
$changelogFile = "fastlane/metadata/android/en-US/changelogs/$changelogNumber.txt"

if (-not (Test-Path $changelogFile)) {
    New-Item -ItemType Directory -Force -Path (Split-Path $changelogFile) | Out-Null
    $PSNativeCommandErrorActionPreference = "Continue"
    $lastTag = git describe --tags --abbrev=0 2>$null
    $PSNativeCommandErrorActionPreference = "Stop"
    $range = if ($LASTEXITCODE -eq 0 -and $lastTag) { "$lastTag..HEAD" } else { "HEAD" }
    git --no-pager log --pretty=format:'%s' $range |
        Sort-Object -Unique |
        Where-Object { $_ -notmatch '^(Merge |Release |Bump |Update |\d+\.\d+\.\d+)' } |
        Select-Object -First 10 |
        ForEach-Object { "• $_" } |
        Set-Content $changelogFile -Encoding UTF8
    nvim $changelogFile
}

New-Item -ItemType Directory -Force -Path "fastlane/metadata/en-AU" | Out-Null
Get-Content $changelogFile | Set-Content "fastlane/metadata/en-AU/release_notes.txt" -Encoding UTF8

# Setup Flutter
git submodule update --init --recursive flutter
$env:PATH = "$(Join-Path $PWD 'flutter' 'bin')$([IO.Path]::PathSeparator)$env:PATH"

# Tests and analysis
flutter test
dart analyze lib
dart format --set-exit-if-changed lib

# Update versions
yq e ".version |= `"$newFlutterVersion`"" -i pubspec.yaml
yq e ".msix_config.msix_version |= `"$newMsixVersion`"" -i pubspec.yaml

# Copy changelogs with timestamps
New-Item -ItemType Directory -Force -Path "assets/changelogs" | Out-Null
foreach ($file in Get-ChildItem "fastlane/metadata/android/en-US/changelogs/*.txt") {
    if ($IsMacOS) {
        $timestamp = stat -f "%B" $file.FullName
    } elseif ($IsWindows) {
        $epoch = [datetime]'1970-01-01T00:00:00Z'
        $timestamp = [int64]($file.CreationTimeUtc - $epoch).TotalSeconds
    } else {
        $timestamp = stat --format="%W" $file.FullName
    }
    Copy-Item $file.FullName "assets/changelogs/$timestamp.txt"
}

function Invoke-Screenshots([string]$AvdName) {
    $proc = Start-Process emulator -ArgumentList @(
        "-avd", $AvdName, "-no-window", "-gpu", "swiftshader_indirect",
        "-noaudio", "-no-boot-anim", "-camera-back", "none"
    ) -PassThru

    $timeout = 300
    $elapsed = 0
    $emulatorId = $null

    while ($elapsed -lt $timeout) {
        $emulatorId = adb devices |
            Where-Object { $_ -match 'emulator-' -and $_ -match 'device$' } |
            ForEach-Object { ($_ -split '\s+')[0] } |
            Select-Object -First 1
        if ($emulatorId) { break }
        if ($proc.HasExited) { exit 1 }
        Start-Sleep 5
        $elapsed += 5
    }

    if (-not $emulatorId) { $proc.Kill(); exit 1 }

    Start-Sleep 15
    flutter drive --profile --driver=test_driver/integration_test.dart `
        --dart-define=QUITTER_DEVICE_TYPE=$AvdName `
        --target=integration_test/screenshot_test.dart -d $emulatorId

    adb -s $emulatorId emu kill 2>$null
    Start-Sleep 5
}

if ($args -contains "-n") {
    Write-Host "Skipping screenshots"
} else {
    Invoke-Screenshots "phoneScreenshots"
    Invoke-Screenshots "sevenInchScreenshots"
    Invoke-Screenshots "tenInchScreenshots"
}

# Commit and tag
$PSNativeCommandErrorActionPreference = "Continue"
git diff --quiet HEAD -- pubspec.yaml fastlane/metadata pubspec.lock assets
$hasChanges = $LASTEXITCODE -ne 0
$PSNativeCommandErrorActionPreference = "Stop"

if ($hasChanges) {
    git add pubspec.yaml fastlane/metadata pubspec.lock assets
    git commit -m "Release $newVersion"
    git tag $newVersion
}

# Build
if ($IsMacOS) { flutter build macos }
if ($IsLinux) { flutter build linux }
if ($IsWindows) { flutter build windows }
flutter config --enable-web
flutter build web --release

git push
git push --tags
