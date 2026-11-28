import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:quitter/weekly_time_estimates.dart';

class TimeSavedItem {
  const TimeSavedItem({
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

class TimeSavedSettingsPage extends StatefulWidget {
  const TimeSavedSettingsPage({super.key, required this.items});

  final List<TimeSavedItem> items;

  @override
  State<TimeSavedSettingsPage> createState() => _TimeSavedSettingsPageState();
}

class _TimeSavedSettingsPageState extends State<TimeSavedSettingsPage> {
  final _formKey = GlobalKey<FormState>();
  final _hours = <String, TextEditingController>{};
  final _minutes = <String, TextEditingController>{};
  final _enabled = <String, bool>{};
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final provider = context.read<AddictionProvider>();
    for (final item in widget.items) {
      final total = provider.weeklyTimeMinutesFor(item.id);
      _enabled[item.id] = total != null;
      _hours[item.id] = TextEditingController(
        text: total == null ? '0' : (total ~/ 60).toString(),
      );
      _minutes[item.id] = TextEditingController(
        text: total == null ? '0' : (total % 60).toString(),
      );
    }
  }

  @override
  void dispose() {
    for (final controller in [..._hours.values, ..._minutes.values]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final provider = context.read<AddictionProvider>();
    try {
      for (final item in widget.items) {
        final enabled = _enabled[item.id]!;
        final minutes = enabled
            ? int.parse(_hours[item.id]!.text) * 60 +
                  int.parse(_minutes[item.id]!.text)
            : null;
        if (enabled && minutes == defaultWeeklyTimeMinutes[item.id]) {
          if (provider.hasWeeklyTimeOverride(item.id)) {
            await provider.resetWeeklyTimeMinutes(item.id);
          }
        } else if (minutes != provider.weeklyTimeMinutesFor(item.id) ||
            (minutes == null && !provider.hasWeeklyTimeOverride(item.id))) {
          await provider.setWeeklyTimeMinutes(item.id, minutes);
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
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.statsTimeEditTitle)),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 4, 20),
                child: Text(
                  l10n.statsTimeConfigure,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              for (final item in widget.items)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.colorScheme.outlineVariant.withValues(
                          alpha: 0.4,
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: item.color.withValues(alpha: 0.14),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                item.icon,
                                color: item.color,
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Switch.adaptive(
                              key: ValueKey('timeEnabled:${item.id}'),
                              value: _enabled[item.id]!,
                              onChanged: _saving
                                  ? null
                                  : (value) => setState(
                                      () => _enabled[item.id] = value,
                                    ),
                            ),
                          ],
                        ),
                        if (_enabled[item.id]!) ...[
                          const SizedBox(height: 14),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _timeField(
                                  item.id,
                                  _hours[item.id]!,
                                  l10n.statsTimeHours,
                                  false,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _timeField(
                                  item.id,
                                  _minutes[item.id]!,
                                  l10n.statsTimeMinutes,
                                  true,
                                ),
                              ),
                            ],
                          ),
                          if (defaultWeeklyTimeMinutes.containsKey(item.id))
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton.icon(
                                onPressed: _saving
                                    ? null
                                    : () {
                                        final total =
                                            defaultWeeklyTimeMinutes[item.id]!;
                                        setState(() {
                                          _hours[item.id]!.text = (total ~/ 60)
                                              .toString();
                                          _minutes[item.id]!.text = (total % 60)
                                              .toString();
                                        });
                                      },
                                icon: const Icon(Icons.restart_alt, size: 16),
                                label: Text(l10n.statsTimeDefault),
                              ),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeField(
    String id,
    TextEditingController controller,
    String label,
    bool isMinutes,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return TextFormField(
      key: ValueKey('time${isMinutes ? 'Minutes:' : 'Hours:'}$id'),
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (_) {
        if (!_enabled[id]!) return null;
        final hours = int.tryParse(_hours[id]!.text);
        final minutes = int.tryParse(_minutes[id]!.text);
        if (hours == null ||
            minutes == null ||
            hours < 0 ||
            minutes < 0 ||
            minutes >= 60 ||
            hours * 60 + minutes > 10080 ||
            hours * 60 + minutes == 0) {
          return l10n.statsTimeInvalid;
        }
        return null;
      },
    );
  }
}
