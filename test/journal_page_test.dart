import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Widget createTestWidget() {
    return const MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: JournalPage(),
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

      expect(find.text('S'), findsNWidgets(2)); // Sunday and Saturday
      expect(find.text('M'), findsOneWidget);
      expect(find.text('T'), findsNWidgets(2)); // Tuesday and Thursday
      expect(find.text('W'), findsOneWidget);
      expect(find.text('F'), findsOneWidget);
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
  });
}
