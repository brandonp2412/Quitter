import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const widgetChannel = MethodChannel("android.widget");

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
}

Color getContrastingColor(Color backgroundColor) {
  final double luminance =
      (0.2126 * backgroundColor.red +
          0.7152 * backgroundColor.green +
          0.0722 * backgroundColor.blue) /
      255;

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

  return currentDate.difference(quitDate).inDays + 1;
}

void toast(
  BuildContext context,
  String message, {
  SnackBarAction? action,
  Duration? duration,
}) {
  final def = SnackBarAction(label: 'OK', onPressed: () {});

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      action: action ?? def,
      duration: duration ?? const Duration(seconds: 4),
    ),
  );
}

String getRelapseEncouragementMessage() {
  final Random random = Random();

  final List<String> messages = [
    "Recovery isn't linear. Every step forward matters, including this one.",
    "You're here, you're trying, and that takes real courage.",
    "Setbacks don't erase your progress. You're learning and growing.",
    "Each restart is proof of your strength, not a sign of weakness.",
    "Tomorrow is a fresh start. You've got this.",
    "Your worth isn't defined by perfect streaks. You matter.",
    "Recovery is a journey with hills and valleys. Keep walking.",
    "You had the strength to start before, and you have it again now.",
    "One moment doesn't define your entire journey forward.",
    "Being here shows you haven't given up. That's powerful.",
    "Progress isn't about perfection—it's about persistence.",
    "You're building resilience with every attempt. Keep building.",
    "Your commitment to trying again is already a victory.",
    "Healing isn't instant, but it's happening with each choice you make.",
    "You're not starting over—you're continuing with more wisdom.",
    "Every expert was once a beginner. Every pro was once an amateur.",
    "Recovery happens one day at a time, sometimes one hour at a time.",
    "You're writing a comeback story. This is just one chapter.",
    "The fact that you're here means you care about yourself. Hold onto that.",
    "Small steps in the right direction are still steps forward.",
  ];

  return messages[random.nextInt(messages.length)];
}
