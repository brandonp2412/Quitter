import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quitter/utils.dart';

void main() {
  group('Utils', () {
    test('selectAll selects all text in controller', () {
      final TextEditingController controller = TextEditingController(
        text: 'abc',
      );
      selectAll(controller);
      expect(controller.selection.baseOffset, 0);
      expect(controller.selection.extentOffset, 3);
    });

    test('selectAll handles empty text', () {
      final TextEditingController controller = TextEditingController(text: '');
      selectAll(controller);
      expect(controller.selection.baseOffset, 0);
      expect(controller.selection.extentOffset, 0);
    });

    test('selectAll handles null text', () {
      final TextEditingController controller = TextEditingController();
      selectAll(controller);
      expect(controller.selection.baseOffset, 0);
      expect(controller.selection.extentOffset, 0);
    });
  });
}
