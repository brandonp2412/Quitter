import 'package:flutter/material.dart';

class CustomQuitEntry {
  String id;
  String title;
  DateTime quitDate;
  Color color;

  CustomQuitEntry({
    required this.id,
    required this.title,
    required this.quitDate,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'quitDate': quitDate.toIso8601String(),
    'color': color.value,
  };

  factory CustomQuitEntry.fromJson(Map<String, dynamic> json) =>
      CustomQuitEntry(
        id: json['id'] as String,
        title: json['title'] as String,
        quitDate: DateTime.parse(json['quitDate'] as String),
        color: Color(json['color'] as int),
      );
}
