import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/utils.dart';
import 'package:uuid/uuid.dart';

import 'package:quitter/color_picker.dart';
import 'package:quitter/icon_picker.dart';

class EditEntryPage extends StatefulWidget {
  final Entry? entry;

  const EditEntryPage({super.key, this.entry});

  @override
  State<EditEntryPage> createState() => _EditEntryPageState();
}

class _EditEntryPageState extends State<EditEntryPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _quitDateController;
  late DateTime _quitDate;
  late Color _selectedColor;
  late IconData _selectedIcon;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry?.title ?? '');
    _quitDate = widget.entry?.quitDate ?? DateTime.now();
    _quitDateController = TextEditingController();
    _updateQuitDateText();
    _selectedIcon = widget.entry?.icon ?? Icons.star;

    final random = Random();
    _selectedColor =
        widget.entry?.color ??
        Colors.primaries.elementAt(random.nextInt(Colors.primaries.length));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _quitDateController.dispose();
    super.dispose();
  }

  Future<void> _presentDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _quitDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate == null || !mounted) return;
    setState(() {
      _quitDate = pickedDate;
      _updateQuitDateText();
    });
  }

  void _updateQuitDateText() {
    final days = daysCeil(_quitDate.toIso8601String());
    _quitDateController.text =
        '${DateFormat.yMMMd().format(_quitDate)} ($days day${days == 1 ? '' : 's'})';
  }

  Future<void> _saveEntry() async {
    if (!_formKey.currentState!.validate()) return;

    final addictions = context.read<AddictionProvider>();
    final title = _titleController.text.trim();
    if (widget.entry == null) {
      await addictions.addEntry(
        Entry(
          id: const Uuid().v4(),
          title: title,
          quitDate: _quitDate,
          color: _selectedColor,
          icon: _selectedIcon,
        ),
      );
    } else {
      await addictions.updateEntry(
        widget.entry!.copyWith(
          title: title,
          quitDate: _quitDate,
          color: _selectedColor,
          icon: _selectedIcon,
        ),
      );
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> _deleteEntry() async {
    final entry = widget.entry;
    if (entry == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(AppLocalizations.of(ctx)!.editEntryDeleteDialogTitle),
        content: Text(AppLocalizations.of(ctx)!.editEntryDeleteDialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(AppLocalizations.of(ctx)!.editEntryDeleteNo),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(AppLocalizations.of(ctx)!.editEntryDeleteYes),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;
    await context.read<AddictionProvider>().deleteEntry(entry.id);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.entry == null
              ? AppLocalizations.of(context)!.editEntryAddTitle
              : AppLocalizations.of(context)!.editEntryEditTitle,
        ),
        actions: [
          if (widget.entry != null)
            IconButton(icon: const Icon(Icons.delete), onPressed: _deleteEntry),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: 8),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!.editEntryTitle,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return AppLocalizations.of(context)!.editEntryTitleError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  controller: _quitDateController,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    )!.quitMilestonesQuitDate,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _presentDatePicker,
                    ),
                  ),
                  onTap: _presentDatePicker,
                ),
                const SizedBox(height: 20),
                FocusableActionDetector(
                  onFocusChange: (hasFocus) {
                    setState(() {});
                  },
                  child: Builder(
                    builder: (context) {
                      final bool hasFocus = Focus.of(context).hasFocus;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(
                            context,
                          )!.editEntryColor,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        isFocused: hasFocus,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ColorPickerWidget(
                            selectedColor: _selectedColor,
                            onColorSelected: (color) {
                              Focus.of(context).requestFocus();
                              setState(() {
                                _selectedColor = color;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                FocusableActionDetector(
                  onFocusChange: (hasFocus) {
                    setState(() {});
                  },
                  child: Builder(
                    builder: (context) {
                      final bool hasFocus = Focus.of(context).hasFocus;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(
                            context,
                          )!.editEntryIcon,
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2,
                            ),
                          ),
                        ),
                        isFocused: hasFocus,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: IconPickerWidget(
                            selectedIcon: _selectedIcon,
                            iconColor: _selectedColor,
                            onIconSelected: (icon) {
                              Focus.of(context).requestFocus();
                              setState(() {
                                _selectedIcon = icon;
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveEntry,
        label: Text(AppLocalizations.of(context)!.editEntrySave),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
