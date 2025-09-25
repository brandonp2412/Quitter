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
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchBar(
          leading: Icon(Icons.search),
          controller: _searchController,
          hintText: 'Search icons...',
          trailing: _searchController.text.isNotEmpty
              ? [
                  IconButton(
                    onPressed: () {
                      _searchController.text = '';
                    },
                    icon: Icon(Icons.clear),
                  ),
                ]
              : null,
        ),

        const SizedBox(height: 16),

        filteredIcons.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('No icons found'),
              )
            : Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: filteredIcons.map((icon) {
                  final isSelected = widget.selectedIcon == icon;

                  return GestureDetector(
                    onTap: () => widget.onIconSelected(icon),
                    child: Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: isSelected
                            ? LinearGradient(
                                colors: [
                                  widget.iconColor ?? Colors.purple,
                                  widget.iconColor?.withValues(alpha: 0.7) ??
                                      Colors.purple.withValues(alpha: 0.7),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                      ),
                      child: Icon(
                        icon,
                        size: widget.iconSize,
                        color: isSelected
                            ? getContrastingColor(
                                widget.iconColor ?? Colors.purple,
                              )
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
      ],
    );
  }
}
