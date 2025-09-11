import 'package:flutter/material.dart';

class AppRadioGroup<T> extends StatelessWidget {
  const AppRadioGroup({
    super.key,
    required this.value,
    required this.onChanged,
    required this.children,
  });

  final T value;
  final ValueChanged<T?> onChanged;
  final List<RadioListTile<T>> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children.map((radioListTile) {
        return RadioListTile<T>(
          title: radioListTile.title,
          value: radioListTile.value,

          groupValue: value,

          onChanged: onChanged,
          selected: radioListTile.selected,
        );
      }).toList(),
    );
  }
}
