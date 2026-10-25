import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

class WeeklySpendField extends StatelessWidget {
  const WeeklySpendField({super.key, required this.controller});

  final TextEditingController controller;

  static double? parse(String text) {
    final value = text.trim();
    return value.isEmpty ? null : double.tryParse(value.replaceAll(',', '.'));
  }

  static String format(double? amount) {
    if (amount == null) return '';
    return amount == amount.truncateToDouble()
        ? amount.toStringAsFixed(0)
        : amount.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return TextFormField(
      key: const ValueKey('weeklySpend'),
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: l10n.editEntryWeeklySpend,
        helperText: l10n.editEntryWeeklySpendHint,
        border: const OutlineInputBorder(),
      ),
      validator: (text) {
        final value = text?.trim() ?? '';
        if (value.isEmpty) return null;
        final amount = parse(value);
        if (!RegExp(r'^\d+(?:[.,]\d{1,2})?$').hasMatch(value) ||
            amount == null ||
            !amount.isFinite) {
          return l10n.editEntryWeeklySpendInvalid;
        }
        return null;
      },
    );
  }
}
