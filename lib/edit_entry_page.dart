import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/entry.dart';
import 'package:quitter/utils.dart';
import 'package:uuid/uuid.dart';

class EditEntryPage extends StatefulWidget {
  final Entry? entry;

  const EditEntryPage({super.key, this.entry});

  @override
  State<EditEntryPage> createState() => _EditEntryPageState();
}

class _EditEntryPageState extends State<EditEntryPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late DateTime _quitDate;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry?.title ?? '');
    _quitDate = widget.entry?.quitDate ?? DateTime.now();
    _selectedColor = widget.entry?.color ?? Colors.blue;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: _quitDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _quitDate = pickedDate;
      });
    });
  }

  void _saveEntry() {
    if (_formKey.currentState!.validate()) {
      final addictions = context.read<AddictionProvider>();
      if (widget.entry == null) {
        final newEntry = Entry(
          id: const Uuid().v4(),
          title: _titleController.text,
          quitDate: _quitDate,
          color: _selectedColor,
        );
        addictions.addEntry(newEntry);
      } else {
        final updatedEntry = Entry(
          id: widget.entry!.id,
          title: _titleController.text,
          quitDate: _quitDate,
          color: _selectedColor,
        );
        addictions.updateEntry(updatedEntry);
      }
      if (!mounted) return;
      Navigator.of(context).pop();
    }
  }

  void _deleteEntry() {
    if (widget.entry != null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to delete this entry?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(false);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      ).then((confirmed) {
        if (confirmed != null && confirmed && mounted) {
          final addictions = context.read<AddictionProvider>();
          addictions.deleteEntry(widget.entry!.id);
          if (!mounted) return;
          Navigator.of(context).pop();
        }
      });
    }
  }

  Color _getContrastColor(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.entry == null ? 'Add entry' : 'Edit entry'),
        actions: [
          if (widget.entry != null)
            IconButton(icon: const Icon(Icons.delete), onPressed: _deleteEntry),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  controller: TextEditingController(
                    text:
                        '${DateFormat.yMMMd().format(_quitDate)} (${daysCeil(_quitDate.toIso8601String())} days)',
                  ),
                  decoration: InputDecoration(
                    labelText: 'Quit date',
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
                    setState(() {}); // Rebuild to update the border
                  },
                  child: Builder(
                    builder: (context) {
                      final bool hasFocus = Focus.of(context).hasFocus;
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Color',
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
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: Colors.primaries.map((color) {
                              final bool isSelected =
                                  _selectedColor.toARGB32() == color.toARGB32();
                              return GestureDetector(
                                onTap: () {
                                  Focus.of(
                                    context,
                                  ).requestFocus(); // Request focus when tapping a color
                                  setState(() {
                                    _selectedColor = color;
                                  });
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 8,
                                              offset: const Offset(2, 2),
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: AnimatedScale(
                                    scale: isSelected ? 1 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.elasticOut,
                                    child: Icon(
                                      Icons.check,
                                      color: _getContrastColor(color),
                                      size: 50,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
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
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
