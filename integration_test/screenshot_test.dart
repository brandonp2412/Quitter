import 'package:quitter/icon_picker.dart';
import 'package:quitter/whats_new.dart';
import 'package:quitter/vaping_page.dart';
import 'package:quitter/time_saved_settings_page.dart';
import 'package:quitter/tca_page.dart';
import 'package:quitter/synthetic_cannabinoids_page.dart';
import 'package:quitter/steroids_page.dart';
import 'package:quitter/stats_page.dart';
import 'package:quitter/ssri_page.dart';
import 'package:quitter/social_media_page.dart';
import 'package:quitter/snri_page.dart';
import 'package:quitter/smokeless_tobacco_page.dart';
import 'package:quitter/pornography_page.dart';
import 'package:quitter/pin_page.dart';
import 'package:quitter/opioid_page.dart';
import 'package:quitter/nitrous_oxide_page.dart';
import 'package:quitter/nicotine_pouches.dart';
import 'package:quitter/money_saved_settings_page.dart';
import 'package:quitter/meth_page.dart';
import 'package:quitter/mdma_page.dart';
import 'package:quitter/maoi_page.dart';
import 'package:quitter/kratom_page.dart';
import 'package:quitter/ketamine_page.dart';
import 'package:quitter/inhalants_page.dart';
import 'package:quitter/ghb_page.dart';
import 'package:quitter/gabapentinoids_page.dart';
import 'package:quitter/entry_page.dart';
import 'package:quitter/enjoying_page.dart';
import 'package:quitter/edit_preset_page.dart';
import 'package:quitter/cocaine_page.dart';
import 'package:quitter/benzodiazepine_page.dart';
import 'package:quitter/adderall_page.dart';
import 'package:quitter/add_addiction_page.dart';
import 'package:quitter/about_page.dart';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/app_theme_mode.dart';
import 'package:quitter/edit_entry_page.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/home_page.dart';
import 'package:quitter/journal_page.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/marijuana_page.dart';
import 'package:quitter/milestone_reference_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quitter/main.dart' as app;
import 'package:quitter/alcohol_page.dart';
import 'package:quitter/settings_page.dart';
import 'package:quitter/smoking_page.dart';
import 'package:quitter/settings_provider.dart';

const _nativeScreenshotLocale = String.fromEnvironment(
  'QUITTER_LOCALE',
  defaultValue: 'en',
);

AppThemeMode get galleryTheme => switch (Uri.base.queryParameters['theme']) {
  'light' => AppThemeMode.light,
  'amoled' => AppThemeMode.pureBlack,
  _ => AppThemeMode.dark,
};

bool get fullGallery => kIsWeb && Uri.base.queryParameters['gallery'] == 'full';

String get screenshotLocale => kIsWeb
    ? Uri.base.queryParameters['locale'] ?? _nativeScreenshotLocale
    : _nativeScreenshotLocale;

String get screenshotStoreLocale => switch (screenshotLocale) {
  'ar' => 'ar',
  'de' => 'de-DE',
  'es' => 'es-ES',
  'fr' => 'fr-FR',
  'id' => 'id',
  'pl' => 'pl-PL',
  'pt' => 'pt-PT',
  'pt-BR' => 'pt-BR',
  'th' => 'th',
  'ur' => 'ur',
  'fa' => 'fa',
  'ja' => 'ja-JP',
  'ko' => 'ko-KR',
  'ru' => 'ru-RU',
  'zh' => 'zh-CN',
  'zh-Hant' => 'zh-TW',
  _ => 'en-US',
};

Future<void> appWrapper() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: const [],
  );
  final settings = SettingsProvider();
  await settings.loadPreferences();
  final addictions = AddictionProvider();
  await addictions.loadAddictions();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => settings),
        ChangeNotifierProvider(create: (context) => addictions),
      ],
      child: const app.QuitterApp(),
    ),
  );
}

void navigate({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

Future<void> screenshot({
  required IntegrationTestWidgetsFlutterBinding binding,
  required WidgetTester tester,
  required String name,
  Future<void> Function(BuildContext context)? goToPage,
  bool settle = false,
}) async {
  await appWrapper();
  await tester.pumpAndSettle();

  if (goToPage != null) {
    final BuildContext context = tester.element(find.byType(HomePage));
    if (context.mounted) await goToPage(context);
  }

  settle ? await tester.pump() : await tester.pumpAndSettle();
  await binding.convertFlutterSurfaceToImage();
  settle ? await tester.pump() : await tester.pumpAndSettle();
  if (kIsWeb || defaultTargetPlatform != TargetPlatform.linux)
    await binding.takeScreenshot(
      fullGallery ? 'full-$name' : '${name}_$screenshotStoreLocale',
    );
}

void main() {
  IntegrationTestWidgetsFlutterBinding binding =
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      final packageInfo = await PackageInfo.fromPlatform();
      if (packageInfo.packageName != 'com.quitter.app.debug' &&
          packageInfo.packageName != 'com.quitter.app.profile') {
        throw StateError(
          'Refusing to clear data in non-test Android package: '
          '${packageInfo.packageName}',
        );
      }
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setString('locale', screenshotLocale);
    await prefs.setInt('notify_every', 0);
    await prefs.setString(
      'vaping',
      DateTime.now().subtract(const Duration(days: 3)).toIso8601String(),
    );
    await prefs.setString(
      'smoking',
      DateTime.now().subtract(const Duration(days: 6)).toIso8601String(),
    );
    await prefs.setString(
      'marijuana',
      DateTime.now().subtract(const Duration(days: 13)).toIso8601String(),
    );

    if (fullGallery) {
      await prefs.setInt('theme_mode', galleryTheme.index);
      final now = DateTime.now();
      final entry = sampleEntry();
      await prefs.setString('entries', jsonEncode([entry.toJson()]));
      await prefs.setString(
        'alcohol',
        now.subtract(const Duration(days: 32)).toIso8601String(),
      );
      await prefs.setString(
        'weekly_spend',
        jsonEncode({'smoking': 65, 'alcohol': 40, 'gallery-custom': 15}),
      );
      await prefs.setString(
        'days',
        jsonEncode({
          'smoking': [14, 28],
          'alcohol': [7],
        }),
      );
      final date = now.toIso8601String().substring(0, 10);
      await prefs.setString(
        'journal_$date',
        'Went for a walk today and felt more focused. Taking it one day at a time.',
      );
      await prefs.setStringList('journal_dates', [date]);
    }
  });

  if (fullGallery) {
    registerFullGallery(binding);
    return;
  }

  group("Generate Quitter App Screenshots", () {
    testWidgets(
      "HomePage",
      (tester) async =>
          await screenshot(binding: binding, tester: tester, name: '1'),
    );

    testWidgets(
      "AlcoholPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '2',
        goToPage: (context) async {
          navigate(context: context, page: const AlcoholPage(started: true));
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.light;
        },
      ),
    );

    testWidgets(
      "SmokingPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '3',
        goToPage: (context) async {
          navigate(context: context, page: const SmokingPage(started: true));
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.dark;
        },
      ),
    );

    testWidgets(
      "CustomEntryPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '4',
        goToPage: (context) async {
          navigate(
            context: context,
            page: EditEntryPage(
              entry: Entry(
                id: 'fake',
                color: Colors.purple,
                quitDate: DateTime.now().subtract(const Duration(days: 3)),
                title: AppLocalizations.of(context)!.addictionSocialMedia,
              ),
            ),
          );
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.light;
        },
      ),
    );

    testWidgets(
      "HomePageLongPress",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '5',
        goToPage: (context) async {
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.dark;
          final smokingLabel = AppLocalizations.of(context)!.addictionSmoking;
          await tester.pumpAndSettle();
          final card = find.text(smokingLabel);
          if (MediaQuery.sizeOf(context).width >= 1000) {
            await tester.tapAt(
              tester.getCenter(card),
              buttons: kSecondaryMouseButton,
            );
          } else {
            await tester.longPress(card);
          }
          await tester.pumpAndSettle();
        },
      ),
    );

    testWidgets(
      "MarijuanaPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '6',
        goToPage: (context) async {
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.light;
          navigate(context: context, page: const MarijuanaPage(started: true));
        },
      ),
    );

    testWidgets(
      "SettingsPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '7',
        goToPage: (context) async {
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.pureBlack;
          navigate(context: context, page: const SettingsPage());
        },
      ),
    );

    testWidgets(
      "JournalPage",
      (tester) async => await screenshot(
        binding: binding,
        tester: tester,
        name: '8',
        goToPage: (context) async {
          final settings = context.read<SettingsProvider>();
          settings.themeMode = AppThemeMode.light;
          await tester.pumpAndSettle();
          final TabController tabController = tester
              .widget<TabBarView>(find.byType(TabBarView))
              .controller!;
          tabController.animateTo(2);
          await tester.pumpAndSettle();
          expect(find.byType(JournalPage).hitTestable(), findsOneWidget);
        },
      ),
    );
  });
}

Entry sampleEntry() => Entry(
  id: 'gallery-custom',
  title: 'Social media break',
  color: Colors.purple,
  quitDate: DateTime.now().subtract(const Duration(days: 42)),
  icon: Icons.phone_android,
  daysAchieved: [7, 14],
);

void registerFullGallery(IntegrationTestWidgetsFlutterBinding binding) {
  final selectedStates = Uri.base.queryParameters['states']?.split(',').toSet();
  void state(
    String name,
    Widget? Function()? page, {
    Future<void> Function(WidgetTester, BuildContext)? action,
  }) {
    if (selectedStates != null && !selectedStates.contains(name)) return;
    testWidgets(name, (tester) async {
      await screenshot(
        binding: binding,
        tester: tester,
        name: name,
        goToPage: (context) async {
          context.read<SettingsProvider>().themeMode = galleryTheme;
          if (page != null) navigate(context: context, page: page()!);
          await tester.pumpAndSettle();
          if (action != null) await action(tester, context);
        },
      );
    });
  }

  Future<void> search(WidgetTester tester, String query) async {
    final bar = tester.widget<SearchBar>(find.byType(SearchBar).hitTestable());
    bar.controller!.text = query;
    await tester.pumpAndSettle();
  }

  Future<void> settingsAction(
    WidgetTester tester,
    BuildContext context,
    String label,
  ) async {
    await search(tester, label);
    final target = find.widgetWithText(ListTile, label).last;
    final settingsPage = find.byType(SettingsPage);
    final list = find
        .descendant(
          of: settingsPage,
          matching: find.byType(
            MediaQuery.sizeOf(context).width >= 1000
                ? SingleChildScrollView
                : ListView,
          ),
        )
        .first;
    await tester.scrollUntilVisible(
      target,
      240,
      scrollable: find
          .descendant(of: list, matching: find.byType(Scrollable))
          .first,
    );
    await tester.tap(target);
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog).hitTestable(), findsOneWidget);
  }

  state('home', null);
  state(
    'home-search',
    null,
    action: (tester, context) => search(tester, 'Smoking'),
  );
  state(
    'home-search-empty',
    null,
    action: (tester, context) => search(tester, 'zzzz'),
  );
  state('add-journey', () => const AddAddictionPage());
  state(
    'add-journey-search',
    () => const AddAddictionPage(initialQuery: 'nicotine'),
  );
  state(
    'add-journey-empty',
    () => const AddAddictionPage(initialQuery: 'zzzz'),
  );
  state(
    'home-actions',
    null,
    action: (tester, context) async {
      final card = find.text(AppLocalizations.of(context)!.addictionSmoking);
      if (MediaQuery.sizeOf(context).width >= 1000) {
        await tester.tapAt(
          tester.getCenter(card),
          buttons: kSecondaryMouseButton,
        );
      } else {
        await tester.longPress(card);
      }
    },
  );
  state(
    'custom-icon-scroll',
    () => EditEntryPage(entry: sampleEntry()),
    action: (tester, context) async {
      await tester.scrollUntilVisible(
        find.byType(IconPickerWidget),
        300,
        scrollable: find
            .descendant(
              of: find.byType(EditEntryPage),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.pumpAndSettle();
    },
  );
  state('custom-create', () => const EditEntryPage());
  state('custom-edit', () => EditEntryPage(entry: sampleEntry()));
  state(
    'custom-delete-confirmation',
    () => EditEntryPage(entry: sampleEntry()),
    action: (tester, context) async {
      await tester.tap(find.byIcon(Icons.delete).hitTestable());
    },
  );
  state(
    'custom-date-picker',
    () => EditEntryPage(entry: sampleEntry()),
    action: (tester, context) async {
      await tester.tap(find.byIcon(Icons.calendar_today).hitTestable().first);
    },
  );
  state('custom-journey', () => EntryPage(entry: sampleEntry()));
  state(
    'preset-edit',
    () => const EditPresetPage(
      presetKey: 'smoking',
      title: 'Smoking',
      icon: Icons.smoking_rooms,
      color: Colors.orange,
    ),
  );
  state(
    'stats',
    null,
    action: (tester, context) async {
      final controller = tester
          .widget<TabBarView>(find.byType(TabBarView))
          .controller!;
      controller.animateTo(1);
      await tester.pumpAndSettle();
      expect(find.byType(StatsPage).hitTestable(), findsOneWidget);
    },
  );
  state(
    'money-saved-settings',
    () => const MoneySavedSettingsPage(
      items: [
        MoneySavedItem(
          id: 'smoking',
          name: 'Smoking',
          icon: Icons.smoking_rooms,
          color: Colors.orange,
        ),
        MoneySavedItem(
          id: 'alcohol',
          name: 'Alcohol',
          icon: Icons.local_bar,
          color: Colors.blue,
        ),
      ],
    ),
  );
  state(
    'time-saved-settings',
    () => const TimeSavedSettingsPage(
      items: [
        TimeSavedItem(
          id: 'smoking',
          name: 'Smoking',
          icon: Icons.smoking_rooms,
          color: Colors.orange,
        ),
        TimeSavedItem(
          id: 'gallery-custom',
          name: 'Social media break',
          icon: Icons.phone_android,
          color: Colors.purple,
        ),
      ],
    ),
  );
  state(
    'journal-filled',
    null,
    action: (tester, context) async {
      tester
          .widget<TabBarView>(find.byType(TabBarView))
          .controller!
          .animateTo(2);
      await tester.pumpAndSettle();
      expect(find.byType(JournalPage).hitTestable(), findsOneWidget);
    },
  );
  state('settings', () => const SettingsPage());
  state(
    'settings-security',
    () => const SettingsPage(),
    action: (tester, context) =>
        search(tester, AppLocalizations.of(context)!.settingsSectionSecurity),
  );
  state(
    'settings-notifications',
    () => const SettingsPage(),
    action: (tester, context) => search(
      tester,
      AppLocalizations.of(context)!.settingsSectionNotifications,
    ),
  );
  state(
    'settings-system',
    () => const SettingsPage(),
    action: (tester, context) =>
        search(tester, AppLocalizations.of(context)!.settingsSectionSystem),
  );
  state(
    'settings-search-empty',
    () => const SettingsPage(),
    action: (tester, context) => search(tester, 'zzzz'),
  );
  state(
    'settings-language-dialog',
    () => const SettingsPage(),
    action: (tester, context) => settingsAction(
      tester,
      context,
      AppLocalizations.of(context)!.settingsLocale,
    ),
  );
  state(
    'settings-notification-dialog',
    () => const SettingsPage(),
    action: (tester, context) => settingsAction(
      tester,
      context,
      AppLocalizations.of(context)!.settingsNotificationFrequency,
    ),
  );
  state(
    'settings-pin-dialog',
    () => const SettingsPage(),
    action: (tester, context) => settingsAction(
      tester,
      context,
      AppLocalizations.of(context)!.settingsPinLock,
    ),
  );
  state(
    'settings-delete-confirmation',
    () => const SettingsPage(),
    action: (tester, context) => settingsAction(
      tester,
      context,
      AppLocalizations.of(context)!.settingsDeleteEverything,
    ),
  );
  state(
    'milestone-reference',
    null,
    action: (tester, context) async {
      final milestone = MarijuanaPage.milestonesFor(
        AppLocalizations.of(context)!,
      ).first;
      navigate(
        context: context,
        page: MilestoneReferencePage(milestone: milestone),
      );
      await tester.pumpAndSettle();
    },
  );
  state('about', () => const AboutPage());
  state('whats-new', () => const WhatsNew());
  state('enjoying-app', () => const EnjoyingPage());
  state('pin-lock', () => const PinPage());
  state(
    'smoking-date-picker',
    () => const SmokingPage(started: true),
    action: (tester, context) async {
      await tester.tap(find.byType(TextField).hitTestable().first);
    },
  );
  state('preset-adderall', () => const AdderallPage(started: false));
  state('preset-alcohol', () => const AlcoholPage(started: false));
  state(
    'preset-benzodiazepine',
    () => const BenzodiazepinePage(started: false),
  );
  state('preset-cocaine', () => const CocainePage(started: false));
  state('preset-gabapentinoids', () => const GabapentinoidPage(started: false));
  state('preset-ghb', () => const GhbPage(started: false));
  state('preset-inhalants', () => const InhalantsPage(started: false));
  state('preset-ketamine', () => const KetaminePage(started: false));
  state('preset-kratom', () => const KratomPage(started: false));
  state('preset-maoi', () => const MaoiPage(started: false));
  state('preset-marijuana', () => const MarijuanaPage(started: false));
  state('preset-mdma', () => const MdmaPage(started: false));
  state('preset-meth', () => const MethPage(started: false));
  state(
    'preset-nicotine-pouches',
    () => const NicotinePouchesPage(started: false),
  );
  state('preset-nitrous-oxide', () => const NitrousOxidePage(started: false));
  state('preset-opioid', () => const OpioidPage(started: false));
  state('preset-pornography', () => const PornographyPage(started: false));
  state(
    'preset-smokeless-tobacco',
    () => const SmokelessTobaccoPage(started: false),
  );
  state('preset-smoking', () => const SmokingPage(started: false));
  state('preset-snri', () => const SnriPage(started: false));
  state('preset-social-media', () => const SocialMediaPage(started: false));
  state('preset-ssri', () => const SsriPage(started: false));
  state('preset-steroids', () => const SteroidsPage(started: false));
  state(
    'preset-synthetic-cannabinoids',
    () => const SyntheticCannabinoidsPage(started: false),
  );
  state('preset-tca', () => const TcaPage(started: false));
  state('preset-vaping', () => const VapingPage(started: false));
  state('journey-smoking', () => const SmokingPage(started: true));
  state('journey-vaping', () => const VapingPage(started: true));
  state('journey-alcohol', () => const AlcoholPage(started: true));
  state('journey-marijuana', () => const MarijuanaPage(started: true));
  state(
    'preset-heroin',
    () => const OpioidPage(started: false, storageKey: 'heroin'),
  );
  state(
    'preset-fentanyl',
    () => const OpioidPage(started: false, storageKey: 'fentanyl'),
  );
  state(
    'home-empty',
    null,
    action: (tester, context) async {
      final prefs = await SharedPreferences.getInstance();
      for (final key in [
        'smoking',
        'vaping',
        'marijuana',
        'alcohol',
        'entries',
      ]) {
        await prefs.remove(key);
      }
      if (context.mounted) {
        await context.read<AddictionProvider>().loadAddictions();
      }
      await tester.pumpAndSettle();
    },
  );
  state(
    'stats-empty',
    null,
    action: (tester, context) async {
      tester
          .widget<TabBarView>(find.byType(TabBarView))
          .controller!
          .animateTo(1);
      await tester.pumpAndSettle();
      expect(find.byType(StatsPage).hitTestable(), findsOneWidget);
    },
  );
}
