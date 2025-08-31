import 'dart:math';

import 'package:flutter/material.dart';

void selectAll(TextEditingController ctrl) {
  ctrl.selection = TextSelection(baseOffset: 0, extentOffset: ctrl.text.length);
}

int daysCeil(String dateStr) {
  final quitDate = DateTime.parse(dateStr);
  final now = DateTime.now();

  final quitDateOnly = DateTime(quitDate.year, quitDate.month, quitDate.day);
  final nowDateOnly = DateTime(now.year, now.month, now.day);
  final result = nowDateOnly.difference(quitDateOnly).inDays;

  if (result == 0) return 1;
  return result;
}

void toast(BuildContext context, String message, [SnackBarAction? action]) {
  final def = SnackBarAction(label: 'OK', onPressed: () {});

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      action: action ?? def,
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
