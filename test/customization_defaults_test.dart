import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/color_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('clearing preset appearance restores defaults after reload', () async {
    SharedPreferences.setMockInitialValues({});
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.setCustomIcon('smoking', Icons.star);
    await provider.setCustomColor('smoking', Colors.blue);
    await provider.setCustomIcon('smoking', null);
    await provider.setCustomColor('smoking', null);

    final reloaded = AddictionProvider();
    await reloaded.loadAddictions();
    expect(reloaded.customIcons, isNot(contains('smoking')));
    expect(reloaded.customColors, isNot(contains('smoking')));
  });

  testWidgets('marks a default shade outside the standard palette', (
    tester,
  ) async {
    final selected = Colors.blue.shade700;
    Color? picked;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ColorPickerWidget(
            selectedColor: selected,
            onColorSelected: (color) => picked = color,
          ),
        ),
      ),
    );

    final checked = find.byWidgetPredicate(
      (widget) => widget is AnimatedScale && widget.scale == 1,
    );
    expect(checked, findsOneWidget);
    await tester.tap(checked);
    expect(picked, selected);
  });
}
