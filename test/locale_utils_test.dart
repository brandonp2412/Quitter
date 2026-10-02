import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/locale_utils.dart';

void main() {
  test('locale preferences distinguish Chinese scripts', () {
    expect(localePreferenceValue(const Locale('zh')), 'zh');
    expect(
      localePreferenceValue(
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      ),
      'zh-Hant',
    );
    expect(
      localePreferenceValue(
        const Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
      ),
      'zh-Hant',
    );
  });

  test('Traditional Chinese preference restores the Hant script', () {
    final locale = localeFromPreference('zh-Hant');
    expect(locale.languageCode, 'zh');
    expect(locale.scriptCode, 'Hant');
  });

  test('Portuguese preferences distinguish Brazil from Portugal', () {
    expect(localePreferenceValue(const Locale('pt')), 'pt');
    expect(
      localePreferenceValue(
        const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
      ),
      'pt-BR',
    );

    final brazil = localeFromPreference('pt-BR');
    expect(brazil.languageCode, 'pt');
    expect(brazil.countryCode, 'BR');

    final portugal = localeFromPreference('pt');
    expect(portugal.languageCode, 'pt');
    expect(portugal.countryCode, isNull);
  });

  test('Brazilian Portuguese preference resolves Brazilian localization', () {
    final brazilian = lookupAppLocalizations(localeFromPreference('pt-BR'));
    final european = lookupAppLocalizations(localeFromPreference('pt'));

    expect(brazilian.localeName, 'pt_BR');
    expect(european.localeName, 'pt');
  });
}
