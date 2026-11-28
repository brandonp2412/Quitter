import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/weekly_spend_field.dart';

class MoneySavedItem {
  const MoneySavedItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  final String id;
  final String name;
  final IconData icon;
  final Color color;
}

class MoneySavedSettingsPage extends StatefulWidget {
  const MoneySavedSettingsPage({super.key, required this.items});

  final List<MoneySavedItem> items;

  @override
  State<MoneySavedSettingsPage> createState() => _MoneySavedSettingsPageState();
}

class _MoneySavedSettingsPageState extends State<MoneySavedSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  final _originalAmounts = <String, double?>{};
  late String _currencyCode;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final provider = context.read<AddictionProvider>();
    _currencyCode = provider.moneyCurrency;
    for (final item in widget.items) {
      final amount = provider.weeklySpendFor(item.id);
      _originalAmounts[item.id] = amount;
      _controllers[item.id] = TextEditingController(
        text: WeeklySpendField.format(amount),
      );
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final provider = context.read<AddictionProvider>();
    try {
      if (_currencyCode != provider.moneyCurrency) {
        await provider.setMoneyCurrency(_currencyCode);
      }
      for (final item in widget.items) {
        final amount = WeeklySpendField.parse(_controllers[item.id]!.text);
        if (amount != _originalAmounts[item.id]) {
          await provider.setWeeklySpend(item.id, amount);
        }
      }
      if (mounted) Navigator.of(context).pop();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.toString())));
      setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.statsMoneySavedTitle)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saving ? null : _save,
        icon: const Icon(Icons.save),
        label: Text(l10n.editEntrySave),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(
              ((MediaQuery.sizeOf(context).width - 600) / 2).clamp(
                16.0,
                double.infinity,
              ),
              16,
              ((MediaQuery.sizeOf(context).width - 600) / 2).clamp(
                16.0,
                double.infinity,
              ),
              96,
            ),
            children: [
              DropdownButtonFormField<String>(
                key: const ValueKey('moneyCurrency'),
                initialValue: _currencyCode,
                isExpanded: true,
                decoration: InputDecoration(
                  labelText: l10n.statsMoneySavedCurrency,
                  border: const OutlineInputBorder(),
                ),
                items: [
                  for (final code in AddictionProvider.supportedMoneyCurrencies)
                    DropdownMenuItem(value: code, child: Text(code)),
                ],
                onChanged: _saving
                    ? null
                    : (code) {
                        if (code != null) {
                          setState(() => _currencyCode = code);
                        }
                      },
              ),
              const SizedBox(height: 8),
              Text(
                l10n.statsMoneySavedCurrencyHint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.editEntryWeeklySpend,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.editEntryWeeklySpendHint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              for (final item in widget.items) ...[
                Row(
                  children: [
                    Icon(item.icon, color: item.color, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(item.name, style: theme.textTheme.titleSmall),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                WeeklySpendField(
                  controller: _controllers[item.id]!,
                  fieldKey: ValueKey('moneyWeeklySpend:${item.id}'),
                  currencyCode: _currencyCode,
                  showHint: false,
                ),
                const SizedBox(height: 20),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
