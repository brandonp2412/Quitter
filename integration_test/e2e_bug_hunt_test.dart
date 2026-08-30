import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/main.dart' as app;
import 'package:quitter/settings_provider.dart';
import 'package:quitter/timeline_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _presetKeys = <String>[
  'adderall',
  'ssri',
  'snri',
  'tca',
  'maoi',
  'nitrous_oxide',
  'kratom',
  'gabapentinoids',
  'ghb',
  'ketamine',
  'inhalants',
  'synthetic_cannabinoids',
  'mdma',
  'steroids',
  'alcohol',
  'benzos',
  'cocaine',
  'marijuana',
  'meth',
  'nicotine_pouches',
  'opioids',
  'heroin',
  'fentanyl',
  'pornography',
  'smoking',
  'smokeless_tobacco',
  'social_media',
  'vaping',
];

Future<void> _clearPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  await prefs.setInt('notify_every', 0);
  await prefs.setString('locale', 'en');
}

Future<void> _seedAllPresets() async {
  await _clearPrefs();
  final prefs = await SharedPreferences.getInstance();
  final quitDate = DateTime.now()
      .subtract(const Duration(days: 30))
      .toIso8601String();
  for (final key in _presetKeys) {
    await prefs.setString(key, quitDate);
  }
}

Finder _cardFor(String key) => find.byWidgetPredicate(
  (widget) => widget is SizedBox && widget.key == ValueKey(key),
);

Future<void> _launch(WidgetTester tester) async {
  final settings = SettingsProvider();
  await settings.loadPreferences();
  final addictions = AddictionProvider();
  await addictions.loadAddictions();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: settings),
        ChangeNotifierProvider.value(value: addictions),
      ],
      child: const app.QuitterApp(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('all persisted preset journeys are reachable from Home', (
    tester,
  ) async {
    await _seedAllPresets();
    await _launch(tester);

    for (final key in _presetKeys) {
      expect(
        _cardFor(key),
        findsOneWidget,
        reason: '$key is persisted but missing from Home',
      );
    }
    expect(find.text('Adult Content'), findsOneWidget);
  });

  testWidgets('malformed persisted dates are ignored without crashing Home', (
    tester,
  ) async {
    await _clearPrefs();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('alcohol', 'not-a-date');
    await prefs.setString('vaping', DateTime.now().toIso8601String());

    await _launch(tester);

    expect(_cardFor('alcohol'), findsNothing);
    expect(_cardFor('vaping'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'every Home journey opens and returns without Flutter exceptions',
    (tester) async {
      await _seedAllPresets();
      await _launch(tester);

      for (final key in _presetKeys) {
        final card = _cardFor(key);
        expect(
          card,
          findsOneWidget,
          reason: '$key must be reachable before navigation',
        );
        await tester.ensureVisible(card);
        await tester.tap(card);
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: '$key threw while opening',
        );
        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(
          tester.takeException(),
          isNull,
          reason: '$key threw while returning Home',
        );
      }
    },
  );

  testWidgets('Settings exposes notification controls for every preset', (
    tester,
  ) async {
    await _seedAllPresets();
    await _launch(tester);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    final found = <String>{};
    final settingsList = find.byType(ListView);
    expect(settingsList, findsOneWidget);
    for (
      var scroll = 0;
      scroll < 30 && found.length < _presetKeys.length;
      scroll++
    ) {
      for (final key in _presetKeys) {
        if (find.byKey(ValueKey('notify_$key')).evaluate().isNotEmpty) {
          found.add(key);
        }
      }
      await tester.drag(settingsList, const Offset(0, -500));
      await tester.pumpAndSettle();
    }

    expect(
      found,
      containsAll(_presetKeys),
      reason:
          'Every tracked preset must have an individual notification toggle',
    );
  });

  testWidgets('clearing a milestone with no relapse history does not crash', (
    tester,
  ) async {
    await _clearPrefs();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'alcohol',
      DateTime.now().subtract(const Duration(days: 30)).toIso8601String(),
    );
    await _launch(tester);

    final card = _cardFor('alcohol');
    await tester.ensureVisible(card);
    await tester.tap(card);
    await tester.pumpAndSettle();

    final milestone = find.byType(TimelineTile).first;
    await tester.ensureVisible(milestone);
    await tester.longPress(milestone);
    await tester.pumpAndSettle();
    expect(find.text('Clear'), findsOneWidget);
    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('duplicate custom titles navigate without duplicate Hero tags', (
    tester,
  ) async {
    await _clearPrefs();
    final prefs = await SharedPreferences.getInstance();
    final quitDate = DateTime.now()
        .subtract(const Duration(days: 10))
        .toIso8601String();
    await prefs.setString(
      'entries',
      jsonEncode([
        {
          'id': 'duplicate-1',
          'title': 'Duplicate title',
          'quitDate': quitDate,
          'color': Colors.blue.toARGB32(),
          'daysAchieved': <int>[],
          'icon': null,
        },
        {
          'id': 'duplicate-2',
          'title': 'Duplicate title',
          'quitDate': quitDate,
          'color': Colors.green.toARGB32(),
          'daysAchieved': <int>[],
          'icon': null,
        },
      ]),
    );
    await _launch(tester);

    expect(find.text('Duplicate title'), findsNWidgets(2));
    final card = _cardFor('duplicate-1');
    await tester.ensureVisible(card);
    await tester.tap(card);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });

  testWidgets('Journal updates word count and persists typed text', (
    tester,
  ) async {
    await _clearPrefs();
    await _launch(tester);

    await tester.tap(find.text('Journal'));
    await tester.pumpAndSettle();
    final editor = find.byType(TextField);
    expect(editor, findsOneWidget);
    await tester.ensureVisible(editor);
    await tester.enterText(editor, 'one   two\nthree');
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.text('3 words'), findsOneWidget);
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now();
    final key =
        'journal_${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    expect(prefs.getString(key), 'one   two\nthree');
    expect(tester.takeException(), isNull);
  });

  testWidgets('show Journal can be toggled while Settings is open', (
    tester,
  ) async {
    await _clearPrefs();
    await _launch(tester);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    final search = find.byType(SearchBar);
    await tester.enterText(search, 'Show journal');
    await tester.pumpAndSettle();
    final toggle = find.ancestor(
      of: find.text('Show journal'),
      matching: find.byType(SwitchListTile),
    );
    expect(toggle, findsOneWidget);
    await tester.tap(toggle);
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Journal'), findsNothing);
  });
}
