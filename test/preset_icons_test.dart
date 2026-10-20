import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/app_icons.dart';
import 'package:quitter/preset_icons.dart';

void main() {
  test('approved preset icons survive name serialization', () {
    for (final icon in [
      PresetIcons.smoking,
      PresetIcons.cannabis,
      PresetIcons.package,
      PresetIcons.balloon,
      PresetIcons.spray,
      PresetIcons.bottle,
      PresetIcons.flask,
      PresetIcons.social,
      PresetIcons.leaf,
    ]) {
      final name = iconNames[icon];
      expect(name, isNotNull);
      expect(allIcons[name], icon);
    }
  });
}
