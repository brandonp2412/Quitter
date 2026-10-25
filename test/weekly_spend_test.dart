import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/edit_preset_page.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/stats_page.dart';
import 'package:quitter/weekly_spend_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test(
    'weekly costs persist, including zero and clearing an override',
    () async {
      final provider = AddictionProvider();
      await provider.loadAddictions();
      await provider.setWeeklySpend('smoking', 72.50);
      await provider.setWeeklySpend('vaping', 0);

      final reloaded = AddictionProvider();
      await reloaded.loadAddictions();
      expect(reloaded.weeklySpendFor('smoking'), 72.50);
      expect(reloaded.weeklySpendFor('vaping'), 0);

      await reloaded.setWeeklySpend('smoking', null);
      final again = AddictionProvider();
      await again.loadAddictions();
      expect(again.weeklySpendFor('smoking'), isNull);
    },
  );

  test('deleting a custom addiction removes its weekly spend', () async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.addEntry(
      Entry(
        id: 'custom-one',
        title: 'Custom',
        quitDate: DateTime.now(),
        color: Colors.blue,
      ),
    );
    await provider.setWeeklySpend('custom-one', 140);
    await provider.deleteEntry('custom-one');
    expect(provider.weeklySpendFor('custom-one'), isNull);
    final reloaded = AddictionProvider();
    await reloaded.loadAddictions();
    expect(reloaded.weeklySpendFor('custom-one'), isNull);
  });

  Widget app(Widget child, AddictionProvider provider) =>
      ChangeNotifierProvider.value(
        value: provider,
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: child),
        ),
      );

  testWidgets('validates nonnegative currency with up to two decimals', (
    tester,
  ) async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    final key = GlobalKey<FormState>();
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      app(
        Form(
          key: key,
          child: WeeklySpendField(controller: controller),
        ),
        provider,
      ),
    );
    for (final invalid in ['-1', '10.999', 'abc', '1,200']) {
      await tester.enterText(
        find.byKey(const ValueKey('weeklySpend')),
        invalid,
      );
      expect(key.currentState!.validate(), isFalse, reason: invalid);
    }
    await tester.enterText(find.byKey(const ValueKey('weeklySpend')), '23,50');
    expect(key.currentState!.validate(), isTrue);
    expect(WeeklySpendField.parse(controller.text), 23.5);
    await tester.enterText(find.byKey(const ValueKey('weeklySpend')), '');
    expect(key.currentState!.validate(), isTrue);
    expect(WeeklySpendField.parse(controller.text), isNull);
  });

  testWidgets('preset editor saves the weekly amount', (tester) async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await tester.pumpWidget(
      app(
        const EditPresetPage(
          presetKey: 'alcohol',
          title: 'Alcohol',
          icon: Icons.local_bar,
          color: Colors.indigo,
        ),
        provider,
      ),
    );
    await tester.enterText(find.byKey(const ValueKey('weeklySpend')), '84.50');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(provider.weeklySpendFor('alcohol'), 84.5);
  });

  testWidgets('custom addiction editor saves the weekly amount', (
    tester,
  ) async {
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await tester.pumpWidget(app(const EditEntryPage(), provider));
    await tester.enterText(find.byType(TextFormField).first, 'Custom habit');
    await tester.enterText(find.byKey(const ValueKey('weeklySpend')), '35');
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(provider.entries.single.title, 'Custom habit');
    expect(provider.weeklySpendFor(provider.entries.single.id), 35);
  });

  testWidgets('stats use weekly spend for presets and custom addictions', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'alcohol': DateTime.now().toIso8601String(),
    });
    final provider = AddictionProvider();
    await provider.loadAddictions();
    await provider.setWeeklySpend('alcohol', 70);
    await provider.addEntry(
      Entry(
        id: 'custom-one',
        title: 'Custom',
        quitDate: DateTime.now(),
        color: Colors.blue,
      ),
    );
    await provider.setWeeklySpend('custom-one', 140);
    await tester.pumpWidget(app(const StatsPage(), provider));

    expect(find.text('\$30'), findsOneWidget);
    expect(find.textContaining('your weekly spending'), findsOneWidget);
  });
}
