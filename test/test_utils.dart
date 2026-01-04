import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void debugPrintText(WidgetTester tester) {
  final textWidgets = tester.allWidgets.whereType<Text>();
  for (final textWidget in textWidgets) {
    print('Text: ${textWidget.data}');
  }
}
