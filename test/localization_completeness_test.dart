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

Set<String> _androidStringKeys(String directory) {
  final contents = File(
    'android/app/src/main/res/$directory/strings.xml',
  ).readAsStringSync();
  return RegExp(
    r'<string\s+name="([^"]+)"',
  ).allMatches(contents).map((match) => match.group(1)!).toSet();
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

  test('Android widget strings exist for every supported locale', () {
    final defaultKeys = _androidStringKeys('values');

    for (final locale in AppLocalizations.supportedLocales) {
      if (locale.languageCode == 'en') continue;

      final localizedKeys = _androidStringKeys('values-${locale.languageCode}');
      expect(
        localizedKeys,
        defaultKeys,
        reason:
            'Android ${locale.languageCode} strings must match the default resource set',
      );
    }
  });
}
