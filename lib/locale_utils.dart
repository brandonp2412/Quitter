import 'dart:ui';

String localePreferenceValue(Locale locale) {
  if (locale.languageCode == 'zh' &&
      (locale.scriptCode == 'Hant' ||
          const {'TW', 'HK', 'MO'}.contains(locale.countryCode))) {
    return 'zh-Hant';
  }
  if (locale.languageCode == 'pt' && locale.countryCode == 'BR') {
    return 'pt-BR';
  }
  return locale.languageCode;
}

Locale localeFromPreference(String value) {
  if (value == 'zh-Hant') {
    return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
  }
  if (value == 'pt-BR') {
    return const Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR');
  }
  return Locale(value);
}
