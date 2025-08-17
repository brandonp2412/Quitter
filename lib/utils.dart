import 'package:flutter/material.dart';

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
}
