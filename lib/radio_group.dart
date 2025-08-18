import 'package:flutter/material.dart';

class RadioGroup<T> extends StatelessWidget {
  const RadioGroup({
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
          // ignore: deprecated_member_use
          groupValue: value,
          // ignore: deprecated_member_use
          onChanged: onChanged,
          selected: radioListTile.selected,
        );
      }).toList(),
    );
  }
}
