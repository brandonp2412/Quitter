import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/addiction_icon.dart';
import 'package:quitter/preset_icons.dart';

void main() {
  testWidgets('custom preset SVGs load and follow the icon theme', (
    tester,
  ) async {
    for (final icon in [
      Icons.air,
      PresetIcons.gabapentin,
      PresetIcons.opioids,
      PresetIcons.meth,
      PresetIcons.maoi,
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          home: IconTheme(
            data: const IconThemeData(color: Colors.teal),
            child: AddictionIcon(icon, size: 30),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final svg = tester.widget<SvgPicture>(find.byType(SvgPicture));
      expect(svg.width, 40);
      expect(svg.height, 40);
      expect(
        svg.colorFilter,
        const ColorFilter.mode(Colors.teal, BlendMode.srcIn),
      );
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('other presets keep their font icons', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AddictionIcon(PresetIcons.flask)),
    );
    expect(find.byType(SvgPicture), findsNothing);
    expect(tester.widget<Icon>(find.byType(Icon)).icon, PresetIcons.flask);
  });
}
