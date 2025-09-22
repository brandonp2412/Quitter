import 'package:flutter/material.dart';
import 'package:quitter/cupertino_icons.dart';

final Map<IconData, String> _cupertinoIconsReverseLookup = allCupertinoIcons
    .map((key, value) => MapEntry(value, key));

class Entry {
  String id;
  String title;
  DateTime quitDate;
  Color color;
  List<int> daysAchieved;
  IconData? icon;

  Entry({
    required this.id,
    required this.title,
    required this.quitDate,
    required this.color,
    this.daysAchieved = const [],
    this.icon,
  });

  Entry copyWith({
    String? id,
    String? title,
    DateTime? quitDate,
    Color? color,
    List<int>? daysAchieved,
    IconData? icon,
  }) {
    return Entry(
      id: id ?? this.id,
      title: title ?? this.title,
      quitDate: quitDate ?? this.quitDate,
      color: color ?? this.color,
      daysAchieved: daysAchieved ?? this.daysAchieved,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'quitDate': quitDate.toIso8601String(),
    'color': color.toARGB32(),
    'daysAchieved': daysAchieved, // Add to JSON serialization
    'icon': icon != null ? _cupertinoIconsReverseLookup[icon] : null,
  };

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
    id: json['id'] as String,
    title: json['title'] as String,
    quitDate: DateTime.parse(json['quitDate'] as String),
    color: Color(json['color'] as int),
    daysAchieved:
        (json['daysAchieved'] as List<dynamic>?)
            ?.map((e) => e as int)
            .toList() ??
        const [],
    icon: json['icon'] != null
        ? allCupertinoIcons[json['icon'] as String]
        : null,
  );
}
