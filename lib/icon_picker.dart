import 'package:flutter/material.dart';
import 'package:quitter/app_icons.dart';
import 'package:quitter/utils.dart';

class IconPickerWidget extends StatefulWidget {
  final IconData? selectedIcon;
  final Function(IconData) onIconSelected;
  final Color? iconColor;
  final double iconSize;

  /// Height of the scrollable icon grid.
  final double gridHeight;

  const IconPickerWidget({
    super.key,
    this.selectedIcon,
    required this.onIconSelected,
    this.iconColor,
    this.iconSize = 30.0,
    this.gridHeight = 300.0,
  });

  @override
  createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  static const double _spacing = 8.0;
  static const double _maxTileExtent = 56.0;

  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<IconData> filteredIcons = [];
  bool _didInitialScroll = false;

  @override
  void initState() {
    super.initState();
    filteredIcons = allIcons.values.toList();
    _searchController.addListener(_filterIcons);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _filterIcons() {
    final String query = _searchController.text.toLowerCase();
    setState(() {
      filteredIcons = query.isEmpty
          ? allIcons.values.toList()
          : allIcons.entries
                .where((entry) => entry.key.contains(query))
                .map((entry) => entry.value)
                .toList();
    });
  }

  /// Scrolls the grid so the initially selected icon is roughly centered.
  ///
  /// Lazy grids only build visible tiles, so we compute the target offset from
  /// the layout geometry rather than relying on the tile's BuildContext.
  void _scrollToSelected(int crossAxisCount, double rowExtent) {
    if (_didInitialScroll || widget.selectedIcon == null) return;
    final int index = filteredIcons.indexOf(widget.selectedIcon!);
    if (index < 0) {
      _didInitialScroll = true;
      return;
    }
    _didInitialScroll = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      final int row = index ~/ crossAxisCount;
      final double target =
          row * rowExtent - (widget.gridHeight - rowExtent) / 2;
      _scrollController.jumpTo(
        target.clamp(0.0, _scrollController.position.maxScrollExtent),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.search),
          ),
          controller: _searchController,
          hintText: 'Search icons...',
          trailing: _searchController.text.isNotEmpty
              ? [
                  IconButton(
                    onPressed: () => _searchController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                ]
              : null,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: widget.gridHeight,
          child: filteredIcons.isEmpty
              ? const Center(child: Text('No icons found'))
              : LayoutBuilder(
                  builder: (context, constraints) {
                    final int crossAxisCount =
                        (constraints.maxWidth / (_maxTileExtent + _spacing))
                            .floor()
                            .clamp(1, 12);
                    final double tileExtent =
                        (constraints.maxWidth -
                            _spacing * (crossAxisCount - 1)) /
                        crossAxisCount;
                    _scrollToSelected(crossAxisCount, tileExtent + _spacing);

                    return GridView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: _spacing,
                        mainAxisSpacing: _spacing,
                      ),
                      itemCount: filteredIcons.length,
                      itemBuilder: (context, index) {
                        final icon = filteredIcons[index];
                        final bool isSelected = widget.selectedIcon == icon;
                        return GestureDetector(
                          onTap: () => widget.onIconSelected(icon),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: isSelected
                                  ? LinearGradient(
                                      colors: [
                                        widget.iconColor ?? Colors.purple,
                                        widget.iconColor?.withValues(
                                              alpha: 0.7,
                                            ) ??
                                            Colors.purple.withValues(
                                              alpha: 0.7,
                                            ),
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
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }
}
