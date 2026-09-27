import 'dart:ui';

String localePreferenceValue(Locale locale) {
  if (locale.languageCode == 'zh' &&
      (locale.scriptCode == 'Hant' ||
          const {'TW', 'HK', 'MO'}.contains(locale.countryCode))) {
    return 'zh-Hant';
  }
  return locale.languageCode;
}

Locale localeFromPreference(String value) {
  if (value == 'zh-Hant') {
    return const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
  }
  return Locale(value);
}
