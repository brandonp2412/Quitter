import 'package:flutter/material.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/color_picker.dart';
import 'package:quitter/icon_picker.dart';

/// Edits the display name, color and icon of a built-in preset tile.
///
/// Presets store their quit date separately, so unlike entries this page only
/// customizes appearance; the chosen values are persisted on
/// [AddictionProvider] as `custom*` overrides keyed by [presetKey].
class EditPresetPage extends StatefulWidget {
  final String presetKey;
  final String title;
  final IconData icon;
  final Color color;

  const EditPresetPage({
    super.key,
    required this.presetKey,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  State<EditPresetPage> createState() => _EditPresetPageState();
}

class _EditPresetPageState extends State<EditPresetPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late Color _selectedColor;
  late IconData _selectedIcon;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _selectedColor = widget.color;
    _selectedIcon = widget.icon;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    final addictions = context.read<AddictionProvider>();
    addictions.setCustomName(widget.presetKey, _titleController.text.trim());
    addictions.setCustomColor(widget.presetKey, _selectedColor);
    addictions.setCustomIcon(widget.presetKey, _selectedIcon);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.editEntryEditTitle)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(height: 8),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: l10n.editEntryTitle,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.editEntryTitleError;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                FocusableActionDetector(
                  child: Builder(
                    builder: (context) {
                      final bool hasFocus = Focus.of(context).hasFocus;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.editEntryColor,
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
                  child: Builder(
                    builder: (context) {
                      final bool hasFocus = Focus.of(context).hasFocus;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: l10n.editEntryIcon,
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
        onPressed: _save,
        label: Text(l10n.editEntrySave),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
