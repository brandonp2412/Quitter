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

Map<String, Map<String, String>> _androidPlurals(String directory) {
  final contents = File(
    'android/app/src/main/res/$directory/strings.xml',
  ).readAsStringSync();
  final plurals = <String, Map<String, String>>{};

  for (final pluralMatch in RegExp(
    r'<plurals\s+name="([^"]+)"[^>]*>([\s\S]*?)</plurals>',
  ).allMatches(contents)) {
    final items = <String, String>{};
    for (final itemMatch in RegExp(
      r'<item\s+quantity="([^"]+)"[^>]*>([\s\S]*?)</item>',
    ).allMatches(pluralMatch.group(2)!)) {
      items[itemMatch.group(1)!] = itemMatch.group(2)!.trim();
    }
    plurals[pluralMatch.group(1)!] = items;
  }

  return plurals;
}

Set<String> _appleBundleLocalizations(String path) {
  final contents = File(path).readAsStringSync();
  final match = RegExp(
    r'<key>CFBundleLocalizations</key>\s*<array>([\s\S]*?)</array>',
  ).firstMatch(contents);
  if (match == null) return const {};

  return RegExp(
    r'<string>([^<]+)</string>',
  ).allMatches(match.group(1)!).map((match) => match.group(1)!).toSet();
}

Map<String, String> _macosMenuTitles() {
  final contents = File(
    'macos/Runner/Base.lproj/MainMenu.xib',
  ).readAsStringSync();
  final titles = <String, String>{};
  for (final match in RegExp(
    r'<(?:menuItem|menu|window)\b[^>]*\btitle="([^"]*)"[^>]*\bid="([^"]+)"',
  ).allMatches(contents)) {
    titles['${match.group(2)!}.title'] = match.group(1)!;
  }
  return titles;
}

Map<String, String> _appleStrings(String path) {
  final contents = File(path).readAsStringSync();
  final strings = <String, String>{};
  for (final match in RegExp(
    r'^"([^"]+)"\s*=\s*"([^"]*)";$',
    multiLine: true,
  ).allMatches(contents)) {
    strings[match.group(1)!] = match.group(2)!;
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

  test('French reference articles preserve the full source detail', () {
    final english = _readArb('en');
    final french = _readArb('fr');

    for (final entry in english.entries) {
      if (entry.key.startsWith('@') ||
          !entry.key.contains('Reference') ||
          entry.value is! String) {
        continue;
      }

      final englishValue = entry.value as String;
      final frenchValue = french[entry.key] as String;

      if (englishValue.length >= 500) {
        expect(
          frenchValue.length,
          greaterThanOrEqualTo((englishValue.length * 0.7).floor()),
          reason:
              '${entry.key} must be a full French translation, not a shortened summary',
        );
      }

      expect(
        '•'.allMatches(frenchValue).length,
        '•'.allMatches(englishValue).length,
        reason: '${entry.key} must preserve the source article bullet detail',
      );
    }
  });

  test('substance-free copy avoids price-language false friends', () {
    final english = _readArb('en');
    final substanceFreeKeys = english.entries
        .where(
          (entry) =>
              !entry.key.startsWith('@') &&
              !entry.key.contains('Reference') &&
              entry.value is String &&
              RegExp(
                r'\bfree\b',
                caseSensitive: false,
              ).hasMatch(entry.value as String),
        )
        .map((entry) => entry.key)
        .toList();

    const priceLanguageByLocale = {
      'es': ['gratis', 'gratuit'],
      'fr': ['gratuit'],
      'ja': ['無料'],
      'ru': ['бесплат'],
      'zh': ['免费'],
    };

    for (final entry in priceLanguageByLocale.entries) {
      final localized = _readArb(entry.key);
      for (final key in substanceFreeKeys) {
        final value = (localized[key] as String).toLowerCase();
        for (final priceFragment in entry.value) {
          expect(
            value.contains(priceFragment),
            isFalse,
            reason:
                '$key in ${entry.key} must express being free of the habit, '
                'not free of charge',
          );
        }
      }
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

  test('localized prose does not leak English scaffolding', () {
    final englishScaffolding = RegExp(
      r'\b(?:your|you|with|without|this|that|from|when|while|after|before|days|weeks|months|years|during|still|people|study|more|less)\b',
      caseSensitive: false,
    );
    const sourcePrefixes = {
      'es': ['Fuente:'],
      'fr': ['Source :', 'Source:'],
      'ja': ['出典：', '出典:'],
      'ru': ['Источник:', 'Источник：'],
      'zh': ['来源：', '来源:'],
    };

    for (final locale in AppLocalizations.supportedLocales) {
      final languageCode = locale.languageCode;
      if (languageCode == 'en') continue;

      final localized = _readArb(languageCode);
      final prefixes = sourcePrefixes[languageCode]!;
      for (final entry in localized.entries) {
        if (entry.key.startsWith('@') || entry.value is! String) continue;

        final prose = (entry.value as String)
            .split('\n')
            .where(
              (line) =>
                  !prefixes.any((prefix) => line.trim().startsWith(prefix)),
            )
            .join('\n')
            .replaceAll(RegExp(r'\{[A-Za-z_]\w*'), '{');

        expect(
          englishScaffolding.firstMatch(prose),
          isNull,
          reason: '${entry.key} must not contain embedded English prose',
        );
      }
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

  test('Japanese reference articles avoid known translation artifacts', () {
    final japanese = _readArb('ja');
    const forbiddenArtifacts = {
      'GHBの引き出し',
      '最もラフなストレッチ',
      '経営陣',
      'リカバリシグナル',
      'リカバリタイムライン',
      '使い捨てのコメダウン',
      '禁欲的なイメージング',
      ' on PubMed',
      'クリーン',
    };

    for (final entry in japanese.entries) {
      if (!entry.key.contains('Reference') ||
          entry.key.startsWith('@') ||
          entry.value is! String) {
        continue;
      }

      final value = entry.value as String;
      for (final artifact in forbiddenArtifacts) {
        expect(
          value,
          isNot(contains(artifact)),
          reason:
              'Japanese reference article contains a known translation artifact',
        );
      }
    }
  });

  test('Japanese recovery copy avoids literal abstinence calques', () {
    final japanese = _readArb('ja');
    const forbiddenArtifacts = {
      'クリーン',
      '3ヶ月の断ち切り',
      '1年間の断ち切り',
      '2年間の断ち切り',
      '2週間の断ち切り',
      '持続的な断ち切り',
      '心機能は断ち切り',
      '報酬的',
    };

    for (final entry in japanese.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) continue;
      final value = entry.value as String;
      for (final artifact in forbiddenArtifacts) {
        expect(
          value,
          isNot(contains(artifact)),
          reason:
              '${entry.key} must not contain a literal Japanese recovery calque',
        );
      }
    }

    for (final key in [
      'adderallReferenceDay60',
      'adderallReferenceDay90',
      'adderallReferenceDay180',
      'adderallReferenceDay365',
    ]) {
      expect(
        japanese[key] as String,
        isNot(contains('禁欲')),
        reason:
            '$key must use medication-abstinence wording, not sexual abstinence',
      );
    }
  });

  test('Russian translations avoid known machine-translation artifacts', () {
    final russian = _readArb('ru');

    const forbiddenGlobally = {
      'скидк',
      'вывод средств',
      'вывода средств',
      'бензол',
      'тяга к еде',
      'тяге к еде',
      'физическому отстранению',
      'симптомы аварии',
      'две недели через',
      'самая крутая часть',
      'книжная полка ncbi',
      'наркомания (2005)',
      'snri',
      'tca',
      'maoi',
      'cws',
      'месяц чистоты',
      'месяца чистки',
      'месяца чисты',
      'авария',
      'безалкогольного периода',
      'очистил вашу систему',
      'пережить сам препарат',
      'он начинает подниматься',
      'перерегулирование',
      'у вас есть это',
      'речь идет о кофе',
      'речь идет о ресторанных',
      'сократите потребление',
      'никотин полностью очищен',
      'пики отмены никотина',
      'жевательного табака и жевательного табака',
      'полет куда-то новый',
      'путешествие без табачного дыма',
      'цифровое детокс-путешествие',
    };

    expect(russian['settingsShowAdderallTracking'], contains('Adderall'));
    expect(russian['settingsNotifyAdderall'], contains('Adderall'));
    expect(
      russian['settingsShowAdderallTracking'],
      isNot(contains(' adderall')),
    );
    expect(russian['settingsNotifyAdderall'], isNot(contains(' adderall')));
    expect(russian['milestoneOpenOriginalSource'], 'Открыть первоисточник');
    expect(
      (russian['methReferenceDay730'] as String).toLowerCase(),
      isNot(contains('алкогол')),
    );
    for (final key in [
      'methReferenceDay1',
      'methReferenceDay3',
      'synthetic_cannabinoidsMilestone90Description',
    ]) {
      expect(
        (russian[key] as String).toLowerCase(),
        isNot(contains('кратом')),
        reason: '$key must not accidentally refer to kratom',
      );
    }

    for (final entry in russian.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) {
        continue;
      }

      final value = (entry.value as String).toLowerCase();
      for (final pattern in [
        RegExp(r'вывод\w* средств'),
        RegExp(r'тяг\w* к еде'),
        RegExp(r'(?:один год|полгода|шесть месяцев|три месяца) бесплатно'),
      ]) {
        expect(
          pattern.hasMatch(value),
          isFalse,
          reason: '${entry.key} must not contain ${pattern.pattern}',
        );
      }
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

  test('Chinese recovery copy avoids literal sobriety artifacts', () {
    final chinese = _readArb('zh');
    const forbiddenArtifacts = {
      '一个月清醒',
      '三个月清醒',
      '清醒一个月',
      '清醒三个月',
      '两周的清醒',
      '三十天的清醒',
      '六个月的清醒',
      '一年的清醒',
      '长期清醒',
      '清醒与闪耀',
      '清醒之旅',
      '欢迎回归派对',
      '自然活动开始感觉有回报',
    };

    for (final entry in chinese.entries) {
      if (entry.key.startsWith('@') || entry.value is! String) continue;
      final value = entry.value as String;
      for (final artifact in forbiddenArtifacts) {
        expect(
          value,
          isNot(contains(artifact)),
          reason: '${entry.key} must not contain a literal sobriety artifact',
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

  test('Play Store screenshots are localized for every supported locale', () {
    const storeLocales = {
      'es': 'es-ES',
      'fr': 'fr-FR',
      'ja': 'ja-JP',
      'ru': 'ru-RU',
      'zh': 'zh-CN',
    };
    const screenshotDirectories = {
      'phoneScreenshots',
      'sevenInchScreenshots',
      'tenInchScreenshots',
    };

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final storeLocale = storeLocales[locale.languageCode]!;
      for (final directory in screenshotDirectories) {
        for (var index = 1; index <= 8; index++) {
          final english = File(
            'fastlane/metadata/android/en-US/images/$directory/'
            '${index}_en-US.png',
          );
          final localized = File(
            'fastlane/metadata/android/$storeLocale/images/$directory/'
            '${index}_$storeLocale.png',
          );

          expect(
            english.existsSync(),
            isTrue,
            reason: 'en-US must provide screenshot $index in $directory',
          );
          expect(
            localized.existsSync(),
            isTrue,
            reason: '$storeLocale must provide screenshot $index in $directory',
          );
          expect(
            localized.readAsBytesSync(),
            isNot(equals(english.readAsBytesSync())),
            reason:
                '$storeLocale screenshot $index in $directory must not be the English image',
          );
        }
      }
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
    const shortDescriptionMarkers = {
      'es': ['progreso', 'hitos', 'diario'],
      'fr': ['progrès', 'étapes', 'journal'],
      'ja': ['進捗', '節目', '日記'],
      'ru': ['прогресс', 'этап', 'дневник'],
      'zh': ['进度', '里程碑', '日记'],
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
        if (filename == 'short_description.txt') {
          for (final marker in shortDescriptionMarkers[locale.languageCode]!) {
            expect(
              localized.toLowerCase(),
              contains(marker.toLowerCase()),
              reason:
                  '$storeLocale/short_description.txt must describe current core features',
            );
          }
        }
        if (filename == 'title.txt') {
          expect(
            localized,
            contains('Quitter'),
            reason: '$storeLocale must preserve the Quitter brand name',
          );
        }
        if (filename == 'full_description.txt') {
          final englishLines = english
              .split('\n')
              .where((line) => line.trim().isNotEmpty)
              .length;
          final localizedLines = localized
              .split('\n')
              .where((line) => line.trim().isNotEmpty)
              .length;
          expect(
            localizedLines,
            englishLines,
            reason:
                '$storeLocale/full_description.txt must match the current listing structure',
          );
          expect(
            '•'.allMatches(localized).length,
            '•'.allMatches(english).length,
            reason:
                '$storeLocale/full_description.txt must translate every feature bullet',
          );
        }
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

  test('localized Play changelogs do not leak English commit prose', () {
    final englishCommitScaffolding = RegExp(
      r'\b(?:chore|ci|fix|feat):\s+(?:remove|replace|use|add|fix|update|move|clean|switch|change)\b',
      caseSensitive: false,
    );
    const storeLocales = ['es-ES', 'fr-FR', 'ja-JP', 'ru-RU', 'zh-CN'];

    for (final storeLocale in storeLocales) {
      final changelogs =
          Directory('fastlane/metadata/android/$storeLocale/changelogs')
              .listSync()
              .whereType<File>()
              .where((file) => file.path.endsWith('.txt'));

      for (final changelog in changelogs) {
        expect(
          englishCommitScaffolding.firstMatch(changelog.readAsStringSync()),
          isNull,
          reason: '${changelog.path} must not retain English commit prose',
        );
      }
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

  test('Apple bundles declare every supported locale', () {
    final supported = AppLocalizations.supportedLocales
        .map((locale) => locale.languageCode)
        .toSet();

    expect(_appleBundleLocalizations('ios/Runner/Info.plist'), supported);
    expect(_appleBundleLocalizations('macos/Runner/Info.plist'), supported);
  });

  test('macOS native menu is translated for every supported locale', () {
    final sourceTitles = _macosMenuTitles();
    final project = File(
      'macos/Runner.xcodeproj/project.pbxproj',
    ).readAsStringSync();
    expect(sourceTitles.length, greaterThan(50));

    for (final locale in AppLocalizations.supportedLocales) {
      final languageCode = locale.languageCode;
      if (languageCode == 'en') continue;

      final stringsPath = 'macos/Runner/$languageCode.lproj/MainMenu.strings';
      final stringsFile = File(stringsPath);
      expect(
        stringsFile.existsSync(),
        isTrue,
        reason: 'macOS $languageCode must provide MainMenu.strings',
      );
      expect(
        project,
        contains('$languageCode.lproj/MainMenu.strings'),
        reason: 'macOS $languageCode menu strings must be in the Xcode project',
      );

      final localized = _appleStrings(stringsPath);
      expect(
        localized.keys.toSet(),
        sourceTitles.keys.toSet(),
        reason: 'macOS $languageCode must localize every titled menu object',
      );
      expect(
        localized.values.where((value) => value.trim().isEmpty),
        isEmpty,
        reason: 'macOS $languageCode menu strings must not be empty',
      );

      final translatable = sourceTitles.entries
          .where((entry) => entry.value != 'APP_NAME')
          .toList();
      final changedCount = translatable
          .where((entry) => localized[entry.key] != entry.value)
          .length;
      expect(
        changedCount,
        greaterThan((translatable.length * 0.8).floor()),
        reason: 'macOS $languageCode menu must not fall back to English',
      );

      if (languageCode == 'ja' ||
          languageCode == 'ru' ||
          languageCode == 'zh') {
        expect(
          _containsTargetScript(languageCode, localized.values.join('\n')),
          isTrue,
          reason: 'macOS $languageCode menu must use the target script',
        );
      }
    }
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
    final defaultPlurals = _androidPlurals('values');
    expect(defaults, isNotEmpty);
    expect(defaultPlurals['widget_days']?.keys.toSet(), {'one', 'other'});
    expect(defaultPlurals['widget_days']?.values, everyElement(contains('%d')));

    const expectedPluralQuantities = {
      'es': {'one', 'other'},
      'fr': {'one', 'other'},
      'ja': {'other'},
      'ru': {'one', 'few', 'many', 'other'},
      'zh': {'other'},
    };

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final localized = _androidStrings('values-${locale.languageCode}');
      final localizedPlurals = _androidPlurals('values-${locale.languageCode}');
      expect(
        localized.keys.toSet(),
        defaults.keys.toSet(),
        reason:
            'Android ${locale.languageCode} strings must match the default resource set',
      );
      expect(
        localizedPlurals.keys.toSet(),
        defaultPlurals.keys.toSet(),
        reason:
            'Android ${locale.languageCode} plurals must match the default resource set',
      );
      expect(
        localizedPlurals['widget_days']?.keys.toSet(),
        expectedPluralQuantities[locale.languageCode],
        reason:
            'Android ${locale.languageCode} must define the locale-appropriate day plural forms',
      );
      expect(
        localizedPlurals['widget_days']?.values,
        everyElement(contains('%d')),
        reason:
            'Android ${locale.languageCode} day plurals must include the day count',
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

    final widget = File(
      'android/app/src/main/java/com/quitter/app/QuitTrackerWidget.kt',
    ).readAsStringSync();
    expect(widget, contains('getQuantityString('));
    expect(widget, contains('R.plurals.widget_days'));
    expect(widget, isNot(contains('widget_day_singular')));
    expect(widget, isNot(contains('widget_day_plural')));
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

  test('Android widget fallback text stays localized', () {
    final activity = File(
      'android/app/src/main/java/com/quitter/app/WidgetSelectionActivity.kt',
    ).readAsStringSync();

    expect(
      activity,
      contains('getString(R.string.widget_addiction_placeholder)'),
    );
    expect(activity, isNot(contains("key.replace('_', ' ')")));
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
