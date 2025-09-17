import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:quitter/addiction_provider.dart';
import 'package:quitter/custom_quit_entry.dart';
import 'package:quitter/utils.dart';
import 'package:uuid/uuid.dart';

class CustomEntryPage extends StatefulWidget {
  final Entry? entry;

  const CustomEntryPage({super.key, this.entry});

  @override
  State<CustomEntryPage> createState() => _CustomEntryPageState();
}

class _CustomEntryPageState extends State<CustomEntryPage> {
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
        title: Text(
          widget.entry == null ? 'Add custom entry' : 'Edit custom entry',
        ),
        actions: [
          if (widget.entry != null)
            IconButton(icon: const Icon(Icons.delete), onPressed: _deleteEntry),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  labelText: 'Quit Date',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _presentDatePicker,
                  ),
                ),
                onTap: _presentDatePicker,
              ),
              const SizedBox(height: 20),
              Text(
                'Select Color:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: Colors.primaries.map((color) {
                  final bool isSelected =
                      _selectedColor.toARGB32() == color.toARGB32();
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 40,
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
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: _getContrastColor(color),
                              size: 22,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ],
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
