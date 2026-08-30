import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Widget createTestWidget() {
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      child: const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: JournalPage(),
      ),
    );
  }

  group('JournalPage', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('displays current month and year', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final now = DateTime.now();
      final formattedMonthYear = DateFormat('MMMM yyyy').format(now);

      expect(find.text(formattedMonthYear), findsOneWidget);
    });

    testWidgets('displays "How was your day?" text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      await tester.dragUntilVisible(
        find.text('How was your day?'),
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(find.text('How was your day?'), findsOneWidget);
    });

    testWidgets('displays hint text for journal entry', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final hint = find.text(
        'Write about your day, thoughts, feelings, or anything you want to remember...',
      );

      await tester.dragUntilVisible(
        hint,
        find.byType(ListView),
        const Offset(0, -300),
      );
      expect(hint, findsOneWidget);
    });

    testWidgets('displays day of the week headers', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final sunday = DateTime(2024, 1, 7);
      for (var index = 0; index < 7; index++) {
        final label = DateFormat.E(
          'en',
        ).format(sunday.add(Duration(days: index)));
        expect(find.text(label), findsOneWidget);
      }
    });

    testWidgets('displays "Previous Month" tooltip', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byTooltip('Previous Month'), findsOneWidget);
    });

    testWidgets('displays "Next Month" tooltip', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(find.byTooltip('Next Month'), findsOneWidget);
    });

    testWidgets('rebuilds a malformed journal date index', (
      WidgetTester tester,
    ) async {
      final today = DateTime.now();
      final dateKey = DateFormat('yyyy-MM-dd').format(today);
      SharedPreferences.setMockInitialValues({
        'journal_dates': 42,
        'journal_$dateKey': 'Recovered entry',
      });

      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getStringList('journal_dates'), contains(dateKey));
    });

    testWidgets('flushes pending journal text when disposed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());
      await tester.pumpAndSettle();

      final hint = find.text(
        'Write about your day, thoughts, feelings, or anything you want to remember...',
      );
      await tester.dragUntilVisible(
        hint,
        find.byType(ListView),
        const Offset(0, -300),
      );
      final editor = find.byType(TextField);
      expect(editor, findsOneWidget);
      await tester.enterText(editor, 'Saved on close');
      await tester.pumpWidget(const SizedBox());
      await tester.pumpAndSettle();

      final today = DateTime.now();
      final dateKey = DateFormat('yyyy-MM-dd').format(today);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('journal_$dateKey'), 'Saved on close');
    });
  });
}
