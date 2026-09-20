import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

Map<String, dynamic> _readArb(String locale) {
  final file = File('lib/l10n/app_$locale.arb');
  return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
}

Set<String> _messageKeys(Map<String, dynamic> arb) {
  return arb.keys.where((key) => !key.startsWith('@')).toSet();
}

Map<String, String> _changelogMessages(String locale) {
  if (locale == 'en') {
    return {
      for (final file
          in Directory('assets/changelogs').listSync().whereType<File>().where(
            (file) => file.path.endsWith('.txt'),
          ))
        file.uri.pathSegments.last.replaceAll('.txt', ''): file
            .readAsStringSync()
            .trim(),
    };
  }

  final decoded =
      jsonDecode(File('assets/changelogs/$locale.json').readAsStringSync())
          as Map<String, dynamic>;
  return decoded.map((key, value) => MapEntry(key, value as String));
}

Map<String, String> _androidStrings(String directory) {
  final contents = File(
    'android/app/src/main/res/$directory/strings.xml',
  ).readAsStringSync();
  final strings = <String, String>{};
  for (final match in RegExp(
    r'<string\s+name="([^"]+)"[^>]*>([\s\S]*?)</string>',
  ).allMatches(contents)) {
    strings[match.group(1)!] = match.group(2)!.trim();
  }
  return strings;
}

bool _containsTargetScript(String languageCode, String value) {
  if (languageCode == 'es' || languageCode == 'fr') {
    return RegExp(r'[A-Za-zÀÂÆÇÉÈÊËÎÏÔŒÙÛÜŸàâæçéèêëîïôœùûüÿ]').hasMatch(value);
  }

  for (final rune in value.runes) {
    final isCjk = rune >= 0x4e00 && rune <= 0x9fff;
    if (languageCode == 'ru' && rune >= 0x0400 && rune <= 0x04ff) {
      return true;
    }
    if (languageCode == 'zh' && isCjk) return true;
    if (languageCode == 'ja' &&
        (isCjk ||
            (rune >= 0x3040 && rune <= 0x30ff) ||
            (rune >= 0xff66 && rune <= 0xff9f))) {
      return true;
    }
  }
  return false;
}

void main() {
  const intentionalSharedValues = {
    'addictionKratom',
    'addictionGhb',
    'addictionMdma',
    'addictionAdderall',
    'addictionAlcohol',
    'addictionSsri',
    'addictionSnri',
    'addictionMaoi',
    'appTitle',
    'tabQuitter',
    'settingsPinTimeoutHint',
    'pinDialogPIN',
    'pinDialogOK',
    'editEntryColor',
    'editEntryDeleteNo',
    'aboutAuthorName',
    'aboutLicenseMIT',
    'ok',
  };
  const intentionalSharedFrenchValues = {
    'tabJournal',
    'addictionFentanyl',
    'settingsSectionNotifications',
    'settingsOrangeColorScheme',
    'aboutVersion',
  };
  const intentionalSharedAndroidValues = {
    'addiction_alcohol',
    'addiction_adderall',
    'addiction_kratom',
    'addiction_ssri',
    'addiction_snri',
    'addiction_maoi',
    'addiction_ghb',
    'addiction_mdma',
    'widget_error',
  };
  const intentionalSharedFrenchAndroidValues = {
    'addiction_fentanyl',
    'widget_addiction_placeholder',
  };

  test('every supported locale has every app message translated', () {
    final english = _readArb('en');
    final englishKeys = _messageKeys(english);

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final localized = _readArb(locale.languageCode);
      final localizedKeys = _messageKeys(localized);

      expect(
        localizedKeys,
        englishKeys,
        reason: '${locale.languageCode} must match the English message set',
      );

      final emptyMessages = englishKeys
          .where((key) => (localized[key] as String).trim().isEmpty)
          .toList();
      expect(
        emptyMessages,
        isEmpty,
        reason: '${locale.languageCode} must not contain empty translations',
      );

      final englishFallbacks = englishKeys
          .where(
            (key) =>
                localized[key] == english[key] &&
                !intentionalSharedValues.contains(key) &&
                !(locale.languageCode == 'fr' &&
                    intentionalSharedFrenchValues.contains(key)),
          )
          .toList();
      expect(
        englishFallbacks,
        isEmpty,
        reason:
            '${locale.languageCode} must not contain placeholder English translations',
      );

      final latinOnlyMessages = englishKeys.where((key) {
        if (intentionalSharedValues.contains(key) ||
            (locale.languageCode == 'fr' &&
                intentionalSharedFrenchValues.contains(key))) {
          return false;
        }
        final value = localized[key] as String;
        return RegExp(r'[A-Za-z]').hasMatch(value) &&
            !_containsTargetScript(locale.languageCode, value);
      }).toList();
      expect(
        latinOnlyMessages,
        isEmpty,
        reason:
            '${locale.languageCode} must not contain English-only placeholder text',
      );
    }
  });

  test('repaired Spanish reference articles stay fully localized', () {
    final spanish = _readArb('es');
    const repairedPrefixes = {
      'adderallReference',
      'alcoholReference',
      'benzodiazepineReference',
      'cocaineReference',
      'ghbReference',
      'inhalantsReference',
      'ketamineReference',
      'kratomReference',
      'maoiReference',
      'marijuanaReference',
      'mdmaReference',
      'methReference',
      'nitrousOxideReference',
      'opioidReference',
      'pornographyReference',
      'smokingReference',
      'snriReference',
      'socialMediaReference',
      'ssriReference',
      'steroidsReference',
      'tcaReference',
    };
    final englishScaffolding = RegExp(
      r'\b(?:without|source|what|why|this|the|with|from|people|study|recovery|months?|weeks?|years?|day|found|improved?|still|keep|one|two|three|six)\b',
      caseSensitive: false,
    );

    for (final entry in spanish.entries) {
      if (!repairedPrefixes.any(entry.key.startsWith) ||
          entry.key.startsWith('@') ||
          entry.value is! String) {
        continue;
      }

      final body = (entry.value as String)
          .split('\n')
          .where((line) => !line.startsWith('Fuente:'))
          .join('\n');
      expect(
        englishScaffolding.firstMatch(body),
        isNull,
        reason: '${entry.key} must not contain mixed English scaffolding',
      );
    }
  });

  test('Japanese reference articles do not leak English prose', () {
    final japanese = _readArb('ja');

    for (final entry in japanese.entries) {
      if (!entry.key.contains('Reference') ||
          entry.key.startsWith('@') ||
          entry.value is! String) {
        continue;
      }

      expect(
        entry.value as String,
        isNot(contains('The Letter')),
        reason: '${entry.key} must keep article prose in Japanese',
      );
    }
  });

  test('Russian translations avoid known machine-translation artifacts', () {
    final russian = _readArb('ru');

    const forbiddenGlobally = {
      'скидк',
      'вывод средств',
      'бензол',
      'тяга к еде',
      'snri',
      'tca',
      'maoi',
      'cws',
    };

    expect(russian['settingsShowAdderallTracking'], contains('Adderall'));
    expect(russian['settingsNotifyAdderall'], contains('Adderall'));
    expect(
      russian['settingsShowAdderallTracking'],
      isNot(contains(' adderall')),
    );
    expect(russian['settingsNotifyAdderall'], isNot(contains(' adderall')));

    for (final entry in russian.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) {
        continue;
      }

      final value = (entry.value as String).toLowerCase();
      for (final phrase in forbiddenGlobally) {
        expect(
          value.contains(phrase),
          isFalse,
          reason: '${entry.key} must not contain "$phrase"',
        );
      }

      if (!entry.key.toLowerCase().contains('smoking')) {
        expect(
          value.contains('отказ от курения') ||
              value.contains('прекращение курения'),
          isFalse,
          reason:
              '${entry.key} must not accidentally refer to quitting smoking',
        );
      }
      if (!entry.key.toLowerCase().contains('ketamine')) {
        expect(
          value.contains('тяга к кетамину'),
          isFalse,
          reason:
              '${entry.key} must not accidentally refer to ketamine cravings',
        );
      }
      if (!entry.key.toLowerCase().contains('alcohol')) {
        expect(
          value.contains('тяга к алкоголю'),
          isFalse,
          reason:
              '${entry.key} must not accidentally refer to alcohol cravings',
        );
      }
    }
  });

  test('screenshot automation covers every supported locale', () {
    final screenshotTest = File(
      'integration_test/screenshot_test.dart',
    ).readAsStringSync();
    final screenshotDriver = File(
      'test_driver/integration_test.dart',
    ).readAsStringSync();
    final screenshotScript = File(
      'scripts/ci_screenshots.sh',
    ).readAsStringSync();
    final workflow = File('.github/workflows/main.yml').readAsStringSync();

    const storeLocales = {
      'en': 'en-US',
      'es': 'es-ES',
      'fr': 'fr-FR',
      'ja': 'ja-JP',
      'ru': 'ru-RU',
      'zh': 'zh-CN',
    };

    expect(workflow, contains('locale: [en, es, fr, ja, ru, zh]'));
    for (final locale in AppLocalizations.supportedLocales) {
      final languageCode = locale.languageCode;
      final storeLocale = storeLocales[languageCode];
      expect(
        storeLocale,
        isNotNull,
        reason: '$languageCode must map to a Play Store screenshot locale',
      );
      if (languageCode == 'en') continue;

      expect(screenshotTest, contains("'$languageCode' => '$storeLocale'"));
      expect(screenshotDriver, contains('"$languageCode" => "$storeLocale"'));
      expect(
        screenshotScript,
        contains('$languageCode) store_locale="$storeLocale"'),
      );
      expect(workflow, contains('$languageCode) STORE_LOCALE=$storeLocale'));
    }
  });

  test('Play Store listing is translated for every supported locale', () {
    const storeLocales = {
      'es': 'es-ES',
      'fr': 'fr-FR',
      'ja': 'ja-JP',
      'ru': 'ru-RU',
      'zh': 'zh-CN',
    };
    const listingLimits = {
      'title.txt': 30,
      'short_description.txt': 80,
      'full_description.txt': 4000,
    };
    final englishDir = Directory('fastlane/metadata/android/en-US');

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final storeLocale = storeLocales[locale.languageCode];
      expect(
        storeLocale,
        isNotNull,
        reason: '${locale.languageCode} must map to a Play Store locale',
      );

      for (final entry in listingLimits.entries) {
        final filename = entry.key;
        final maxCharacters = entry.value;
        final english = File(
          '${englishDir.path}/$filename',
        ).readAsStringSync().trim();
        expect(
          english.runes.length,
          lessThanOrEqualTo(maxCharacters),
          reason: 'en-US/$filename must stay within the Play Store limit',
        );
        final localizedFile = File(
          'fastlane/metadata/android/$storeLocale/$filename',
        );
        expect(
          localizedFile.existsSync(),
          isTrue,
          reason: '$storeLocale must provide $filename',
        );

        final localized = localizedFile.readAsStringSync().trim();
        expect(
          localized,
          isNotEmpty,
          reason: '$storeLocale/$filename must not be empty',
        );
        expect(
          localized,
          isNot(equals(english)),
          reason: '$storeLocale/$filename must not fall back to English',
        );
        expect(
          localized.runes.length,
          lessThanOrEqualTo(maxCharacters),
          reason:
              '$storeLocale/$filename must stay within the Play Store limit',
        );
      }
      final englishChangelogs = Directory('${englishDir.path}/changelogs')
          .listSync()
          .whereType<File>()
          .where((file) => file.path.endsWith('.txt'))
          .toList();
      expect(englishChangelogs, isNotEmpty);
      englishChangelogs.sort((a, b) {
        final aVersion = int.parse(a.uri.pathSegments.last.split('.').first);
        final bVersion = int.parse(b.uri.pathSegments.last.split('.').first);
        return aVersion.compareTo(bVersion);
      });
      final latestEnglishChangelog = englishChangelogs.last;
      final changelogName = latestEnglishChangelog.uri.pathSegments.last;
      final localizedChangelog = File(
        'fastlane/metadata/android/$storeLocale/changelogs/$changelogName',
      );
      expect(
        localizedChangelog.existsSync(),
        isTrue,
        reason: '$storeLocale must translate the latest Play changelog',
      );
      final englishChangelog = latestEnglishChangelog.readAsStringSync().trim();
      final localizedChangelogText = localizedChangelog
          .readAsStringSync()
          .trim();
      expect(localizedChangelogText, isNotEmpty);
      expect(
        localizedChangelogText,
        isNot(equals(englishChangelog)),
        reason: '$storeLocale latest Play changelog must not be English',
      );
      expect(
        _containsTargetScript(locale.languageCode, localizedChangelogText),
        isTrue,
        reason: '$storeLocale latest Play changelog must be translated',
      );
    }
  });

  test('every non-empty Play changelog has localization coverage', () {
    final result = Process.runSync('python3', [
      'scripts/sync_play_changelogs.py',
      '--check',
    ]);

    expect(
      result.exitCode,
      0,
      reason:
          'Localized Play changelog coverage failed:\n'
          '${result.stdout}\n${result.stderr}',
    );
  });

  test('web metadata and privacy policy cover every supported locale', () {
    final englishManifest =
        jsonDecode(File('web/manifest.json').readAsStringSync())
            as Map<String, dynamic>;
    final englishDescription = englishManifest['description'] as String;
    expect(englishManifest['lang'], 'en');

    const manifestLocales = {'es', 'fr', 'ja', 'ru', 'zh'};
    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      expect(
        manifestLocales,
        contains(locale.languageCode),
        reason: '${locale.languageCode} must have localized web metadata',
      );
      final manifest =
          jsonDecode(
                File(
                  'web/manifest_${locale.languageCode}.json',
                ).readAsStringSync(),
              )
              as Map<String, dynamic>;
      expect(manifest['lang'], locale.languageCode);
      expect(manifest['description'], isNotEmpty);
      expect(
        manifest['description'],
        isNot(equals(englishDescription)),
        reason: '${locale.languageCode} PWA description must be translated',
      );
    }

    final index = File('web/index.html').readAsStringSync();
    expect(index, contains('manifest_'));
    expect(index, contains('Sigue tu progreso al dejar hábitos'));
    expect(index, contains('Suivez vos progrès'));
    expect(index, contains('やめたい習慣'));
    expect(index, contains('Отслеживайте прогресс'));
    expect(index, contains('记录戒除习惯'));

    final privacy = File('docs/privacy-policy.html').readAsStringSync();
    expect(privacy, contains('Política de privacidad de Quitter'));
    expect(privacy, contains('Politique de confidentialité de Quitter'));
    expect(privacy, contains('Quitter プライバシーポリシー'));
    expect(privacy, contains('Quitter — Политика конфиденциальности'));
    expect(privacy, contains('Quitter 隐私政策'));
    expect(privacy, contains('?lang=es'));
    expect(privacy, contains('?lang=fr'));
    expect(privacy, contains('?lang=ja'));
    expect(privacy, contains('?lang=ru'));
    expect(privacy, contains('?lang=zh'));
  });

  test('every supported locale translates every changelog entry', () {
    final english = _changelogMessages('en');
    expect(english, isNotEmpty);

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final localized = _changelogMessages(locale.languageCode);
      expect(
        localized.keys.toSet(),
        english.keys.toSet(),
        reason:
            '${locale.languageCode} changelogs must match the English entry set',
      );

      final emptyMessages = english.keys
          .where((key) => localized[key]?.trim().isEmpty ?? true)
          .toList();
      expect(
        emptyMessages,
        isEmpty,
        reason: '${locale.languageCode} changelogs must not be empty',
      );

      final englishFallbacks = english.keys
          .where((key) => localized[key] == english[key])
          .toList();
      expect(
        englishFallbacks,
        isEmpty,
        reason:
            '${locale.languageCode} changelogs must not fall back to English',
      );

      final wrongScript = localized.entries
          .where(
            (entry) => !_containsTargetScript(locale.languageCode, entry.value),
          )
          .map((entry) => entry.key)
          .toList();
      expect(
        wrongScript,
        isEmpty,
        reason:
            '${locale.languageCode} changelogs must contain translated text',
      );
    }
  });

  test('milestone share copy is localized and wired to the UI', () async {
    final english = await AppLocalizations.delegate.load(const Locale('en'));
    final japanese = await AppLocalizations.delegate.load(const Locale('ja'));
    final chinese = await AppLocalizations.delegate.load(const Locale('zh'));

    expect(
      english.quitMilestonesShareMessage(1, 'alcohol'),
      "I'm 1 day clean from alcohol!",
    );
    expect(
      english.quitMilestonesShareMessage(2, 'alcohol'),
      "I'm 2 days clean from alcohol!",
    );
    expect(
      japanese.quitMilestonesShareMessage(2, 'アルコール'),
      'アルコールをやめて2日間継続しています！',
    );
    expect(chinese.quitMilestonesShareMessage(2, '酒精'), '我已经戒除 酒精 2 天了！');

    final page = File('lib/quit_milestones_page.dart').readAsStringSync();
    expect(page, contains('l10n.quitMilestonesShareMessage(day, title)'));
  });

  test(
    'duration labels and notification copy are localized and wired',
    () async {
      final english = await AppLocalizations.delegate.load(const Locale('en'));
      final japanese = await AppLocalizations.delegate.load(const Locale('ja'));
      final chinese = await AppLocalizations.delegate.load(const Locale('zh'));

      expect(english.timelineMilestoneDay(3), 'Day 3');
      expect(english.timelineMilestoneYears(1), '1 Year');
      expect(english.timelineMilestoneYears(2), '2 Years');
      expect(english.statsDayUnit(1), 'day');
      expect(english.statsDayUnit(2), 'days');
      expect(english.statsHoursSuffix(4), '4h');
      expect(english.notificationTestBody(1), contains('every 1 day '));
      expect(english.notificationTestBody(2), contains('every 2 days '));

      expect(japanese.timelineMilestoneDay(3), '3日目');
      expect(japanese.timelineMilestoneYears(2), '2年');
      expect(japanese.statsDayUnit(2), '日');
      expect(japanese.statsHoursSuffix(4), '4時間');
      expect(japanese.notificationTestBody(2), contains('2日ごと'));

      expect(chinese.timelineMilestoneDay(3), '第3天');
      expect(chinese.timelineMilestoneYears(2), '2年');
      expect(chinese.statsDayUnit(2), '天');
      expect(chinese.statsHoursSuffix(4), '4小时');
      expect(chinese.notificationTestBody(2), contains('每 2 天'));

      final timeline = File('lib/timeline_tile.dart').readAsStringSync();
      expect(timeline, contains('l10n.timelineMilestoneDay(milestone.day)'));
      expect(timeline, contains('l10n.timelineMilestoneYears('));

      final stats = File('lib/stats_page.dart').readAsStringSync();
      expect(stats, contains('l10n.statsDayUnit(totalDays)'));
      expect(stats, contains('l10n.statsDaysSuffix(e.days)'));
      expect(stats, contains('l10n.statsHoursSuffix('));

      final settings = File('lib/settings_page.dart').readAsStringSync();
      expect(settings, contains('l10n.notificationTestBody(days)'));
    },
  );

  test('Android widget strings are translated for every supported locale', () {
    final defaults = _androidStrings('values');
    expect(defaults, isNotEmpty);

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final localized = _androidStrings('values-${locale.languageCode}');
      expect(
        localized.keys.toSet(),
        defaults.keys.toSet(),
        reason:
            'Android ${locale.languageCode} strings must match the default resource set',
      );

      final emptyStrings = defaults.keys
          .where((key) => localized[key]?.trim().isEmpty ?? true)
          .toList();
      expect(
        emptyStrings,
        isEmpty,
        reason:
            'Android ${locale.languageCode} strings must not contain empty translations',
      );

      final englishFallbacks = defaults.keys
          .where(
            (key) =>
                localized[key] == defaults[key] &&
                !intentionalSharedAndroidValues.contains(key) &&
                !(locale.languageCode == 'fr' &&
                    intentionalSharedFrenchAndroidValues.contains(key)),
          )
          .toList();
      expect(
        englishFallbacks,
        isEmpty,
        reason:
            'Android ${locale.languageCode} strings must not contain placeholder English translations',
      );

      final latinOnlyStrings = defaults.keys.where((key) {
        if (intentionalSharedAndroidValues.contains(key) ||
            (locale.languageCode == 'fr' &&
                intentionalSharedFrenchAndroidValues.contains(key))) {
          return false;
        }
        final value = localized[key]!;
        return RegExp(r'[A-Za-z]').hasMatch(value) &&
            !_containsTargetScript(locale.languageCode, value);
      }).toList();
      expect(
        latinOnlyStrings,
        isEmpty,
        reason:
            'Android ${locale.languageCode} strings must not contain English-only placeholder text',
      );
    }
  });

  test('every milestone reference article is wired to localized content', () {
    final pages = Directory('lib').listSync().whereType<File>().where(
      (file) => file.path.endsWith('_page.dart'),
    );
    var articleCount = 0;

    for (final file in pages) {
      final contents = file.readAsStringSync();
      final referenceCount = RegExp(
        r'\breferenceContent:',
      ).allMatches(contents).length;
      if (referenceCount == 0) continue;

      final localizedCount = RegExp(
        r'\blocalizedReferenceContent:',
      ).allMatches(contents).length;
      expect(
        localizedCount,
        referenceCount,
        reason: '${file.path} must localize every reference article',
      );
      articleCount += referenceCount;
    }

    expect(articleCount, greaterThan(0));
  });

  test('Flutter UI does not hard-code user-facing text', () {
    final dartFiles = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where(
          (file) =>
              file.path.endsWith('.dart') &&
              !file.path.contains('/l10n/generated/'),
        );
    final hardCodedValues = <String>[];
    final patterns = [
      RegExp(r'''(?:Text|TextSpan)\(\s*['"]([^'"]*)['"]'''),
      RegExp(
        r'''(?:labelText|hintText|helperText|errorText|tooltip|semanticLabel|message|title|subtitle|content)\s*:\s*['"]([^'"]*)['"]''',
      ),
    ];

    for (final file in dartFiles) {
      final contents = file.readAsStringSync();
      for (final pattern in patterns) {
        for (final match in pattern.allMatches(contents)) {
          final literalText = match
              .group(1)!
              .replaceAll(RegExp(r'\$\{[^}]*\}'), '')
              .replaceAll(RegExp(r'\$[A-Za-z_]\w*'), '');
          if (RegExp(r'[A-Za-z]').hasMatch(literalText)) {
            hardCodedValues.add('${file.path}: ${match.group(0)}');
          }
        }
      }
    }

    expect(
      hardCodedValues,
      isEmpty,
      reason:
          'User-facing Flutter strings must come from AppLocalizations instead '
          'of hard-coded literals',
    );
  });

  test('Android layouts do not hard-code user-facing text', () {
    final layouts = Directory(
      'android/app/src/main/res/layout',
    ).listSync().whereType<File>().where((file) => file.path.endsWith('.xml'));
    final hardCodedValues = <String>[];
    final attribute = RegExp(
      r'android:(?:text|hint|contentDescription)="([^"]*)"',
    );

    for (final file in layouts) {
      final contents = file.readAsStringSync();
      for (final match in attribute.allMatches(contents)) {
        final value = match.group(1)!;
        if (!value.startsWith('@') && !value.startsWith('?')) {
          hardCodedValues.add('${file.path}: $value');
        }
      }
    }

    expect(hardCodedValues, isEmpty);
  });
}
