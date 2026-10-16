import 'dart:io';

import 'package:integration_test/integration_test_driver_extended.dart';

Future<void> main() async => await integrationDriver(
  onScreenshot: (name, image, [args]) async {
    final deviceType = Platform.environment["QUITTER_DEVICE_TYPE"];
    if (deviceType == null || deviceType.isEmpty) {
      throw "QUITTER_DEVICE_TYPE must be set, so integration driver knows where to save screenshots.";
    }
    final locale = Platform.environment["QUITTER_LOCALE"] ?? "en";
    final storeLocale = switch (locale) {
      "ar" => "ar",
      "de" => "de-DE",
      "es" => "es-ES",
      "fr" => "fr-FR",
      "id" => "id",
      "pl" => "pl-PL",
      "pt" => "pt-PT",
      "pt-BR" => "pt-BR",
      "th" => "th",
      "ur" => "ur",
      "fa" => "fa",
      "ja" => "ja-JP",
      "ko" => "ko-KR",
      "ru" => "ru-RU",
      "zh" => "zh-CN",
      "zh-Hant" => "zh-TW",
      _ => "en-US",
    };

    final imgFile = await File(
      'fastlane/metadata/android/$storeLocale/images/$deviceType/$name.png',
    ).create(recursive: true);
    await imgFile.writeAsBytes(image);
    return true;
  },
  writeResponseOnFailure: true,
);
