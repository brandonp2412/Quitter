import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quitter/main.dart';

const widgetChannel = MethodChannel("android.widget");

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
}

Color getContrastingColor(Color backgroundColor) {
  final luminance = backgroundColor.computeLuminance();
  return luminance > 0.5 ? Colors.black : Colors.white;
}

String getTimeString(int totalMinutes) {
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  final hour12 = hours == 0 ? 12 : (hours > 12 ? hours - 12 : hours);
  final amPm = hours < 12 ? 'AM' : 'PM';
  final minutesStr = minutes.toString().padLeft(2, '0');
  return '$hour12:$minutesStr $amPm';
}

int daysCeil(String dateStr) {
  final quitDateTime = DateTime.parse(dateStr);
  final quitDate = DateTime(
    quitDateTime.year,
    quitDateTime.month,
    quitDateTime.day,
  );
  final today = DateTime.now();
  final currentDate = DateTime(today.year, today.month, today.day);

  final quitDays = quitDate.millisecondsSinceEpoch ~/ (1000 * 60 * 60 * 24);
  final currentDays =
      currentDate.millisecondsSinceEpoch ~/ (1000 * 60 * 60 * 24);

  return (currentDays - quitDays) + 1;
}

void toast(String message, {SnackBarAction? action}) {
  final def = SnackBarAction(label: 'OK', onPressed: () {});

  rootScaffoldMessenger.currentState!.showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      action: action ?? def,
      duration: const Duration(seconds: 4),
    ),
  );
}

String getRelapseEncouragementMessage(BuildContext context) {
  final Random random = Random();
  final l10n = AppLocalizations.of(context)!;

  final List<String> messages = [
    l10n.relapseMessage1,
    l10n.relapseMessage2,
    l10n.relapseMessage3,
    l10n.relapseMessage4,
    l10n.relapseMessage5,
    l10n.relapseMessage6,
    l10n.relapseMessage7,
    l10n.relapseMessage8,
    l10n.relapseMessage9,
    l10n.relapseMessage10,
    l10n.relapseMessage11,
    l10n.relapseMessage12,
    l10n.relapseMessage13,
    l10n.relapseMessage14,
    l10n.relapseMessage15,
    l10n.relapseMessage16,
    l10n.relapseMessage17,
    l10n.relapseMessage18,
    l10n.relapseMessage19,
    l10n.relapseMessage20,
  ];

  return messages[random.nextInt(messages.length)];
}