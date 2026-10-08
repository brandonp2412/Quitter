import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/quit_milestones_page.dart';
import 'package:quitter/settings_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('localized milestone page titles fit narrow app bars', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 760);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    SharedPreferences.setMockInitialValues({});
    final settings = SettingsProvider();
    await settings.loadPreferences();
    final addictions = AddictionProvider();
    await addictions.loadAddictions();

    for (final locale in AppLocalizations.supportedLocales) {
      final l10n = lookupAppLocalizations(locale);
      for (final title in [
        l10n.steroidsPageTitle,
        l10n.synthetic_cannabinoidsPageTitle,
      ]) {
        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<SettingsProvider>.value(value: settings),
              ChangeNotifierProvider<AddictionProvider>.value(
                value: addictions,
              ),
            ],
            child: MaterialApp(
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: QuitMilestonesPage(
                key: ValueKey('\${locale.toLanguageTag()}-\$title'),
                title: title,
                storageKey: 'title-fit-test',
                milestones: const [],
                headerStarted: 'Started',
                headerNotStarted: 'Not started',
                subtitleStarted: 'Started',
                subtitleNotStarted: 'Not started',
                initialStarted: false,
              ),
            ),
          ),
        );
        await tester.pump();

        final appBar = find.byType(AppBar);
        final fitted = find.descendant(
          of: appBar,
          matching: find.byType(FittedBox),
        );
        final titleText = find.descendant(
          of: appBar,
          matching: find.text(title),
        );

        expect(fitted, findsOneWidget);
        expect(titleText, findsOneWidget);
        expect(tester.widget<FittedBox>(fitted).fit, BoxFit.scaleDown);
        expect(
          tester.renderObject<RenderParagraph>(titleText).didExceedMaxLines,
          isFalse,
        );

        final fittedRect = tester.getRect(fitted);
        final textRect = tester.getRect(titleText);
        expect(textRect.left, greaterThanOrEqualTo(fittedRect.left - 1));
        expect(textRect.right, lessThanOrEqualTo(fittedRect.right + 1));
      }
    }
  });
}
