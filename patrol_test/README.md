# Android device tests

These Patrol tests exercise Quitter's Android integrations against a real
device and launcher UI.

Run the home screen widget test on a clean Android emulator or physical device
with an English system locale and a launcher that supports widget pinning:

```sh
flutter pub global activate patrol_cli
patrol doctor
patrol test -t patrol_test/home_screen_widget_test.dart
```

The test pins a Quitter widget to the home screen and configures it to track a
temporary smoking quit date. Patrol uninstalls the app after the test by
default, which also removes the widget. Pass `--no-uninstall` when debugging if
the installed app should remain afterward.
