import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitter/cupertino_icons.dart';
import 'package:quitter/utils.dart';

class IconPickerWidget extends StatefulWidget {
  final IconData? selectedIcon;
  final Function(IconData) onIconSelected;
  final Color? iconColor;
  final double iconSize;

  const IconPickerWidget({
    super.key,
    this.selectedIcon,
    required this.onIconSelected,
    this.iconColor,
    this.iconSize = 30.0,
  });

  @override
  createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<IconData> filteredIcons = [];

  @override
  void initState() {
    super.initState();
    filteredIcons = allCupertinoIcons.entries
        .map((entry) => entry.value)
        .toList();
    _searchController.addListener(_filterIcons);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterIcons() {
    String query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredIcons = allCupertinoIcons.entries
            .map((entry) => entry.value)
            .toList();
      });
      return;
    }

    setState(() {
      filteredIcons = allCupertinoIcons.entries
          .where((entry) => entry.key.contains(query))
          .map((entry) => entry.value)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CupertinoSearchTextField(
            controller: _searchController,
            placeholder: 'Search icons...',
          ),
        ),

        // Icon grid
        Expanded(
          child: filteredIcons.isEmpty
              ? const Center(child: Text('No icons found'))
              : GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: filteredIcons.length,
                  itemBuilder: (context, index) {
                    final icon = filteredIcons[index];
                    final isSelected = widget.selectedIcon == icon;

                    return GestureDetector(
                      onTap: () => widget.onIconSelected(icon),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          gradient: LinearGradient(
                            colors: [
                              widget.iconColor ?? Colors.purple,
                              widget.iconColor?.withValues(alpha: 0.7) ??
                                  Colors.purple.withValues(alpha: 0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: isSelected
                              ? Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2.0,
                                )
                              : null,
                        ),
                        child: Icon(
                          icon,
                          size: widget.iconSize,
                          color: getContrastingColor(
                            widget.iconColor ?? Colors.purple,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
