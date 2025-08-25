import 'package:flutter/material.dart';

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
}

int daysCeil(String dateStr) {
  final quitDate = DateTime.parse(dateStr);
  final now = DateTime.now();

  final quitDateOnly = DateTime(quitDate.year, quitDate.month, quitDate.day);
  final nowDateOnly = DateTime(now.year, now.month, now.day);
  return nowDateOnly.difference(quitDateOnly).inDays + 1;
}
