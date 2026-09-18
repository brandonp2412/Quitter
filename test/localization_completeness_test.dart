import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

Map<String, dynamic> _readArb(String locale) {
  final file = File('lib/l10n/app_$locale.arb');
  return jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
}

Set<String> _messageKeys(Map<String, dynamic> arb) {
  return arb.keys.where((key) => !key.startsWith('@')).toSet();
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

void main() {
  const intentionalSharedValues = {
    'addictionGhb',
    'addictionMdma',
    'addictionSsri',
    'addictionSnri',
    'addictionMaoi',
    'appTitle',
    'tabQuitter',
    'settingsPinTimeoutHint',
    'pinDialogPIN',
    'pinDialogOK',
    'aboutAuthorName',
    'aboutLicenseMIT',
    'ok',
  };
  const intentionalSharedAndroidValues = {
    'addiction_ssri',
    'addiction_snri',
    'addiction_maoi',
    'addiction_ghb',
    'addiction_mdma',
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
                !intentionalSharedValues.contains(key),
          )
          .toList();
      expect(
        englishFallbacks,
        isEmpty,
        reason:
            '${locale.languageCode} must not contain placeholder English translations',
      );
    }
  });

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
                !intentionalSharedAndroidValues.contains(key),
          )
          .toList();
      expect(
        englishFallbacks,
        isEmpty,
        reason:
            'Android ${locale.languageCode} strings must not contain placeholder English translations',
      );
    }
  });
}
