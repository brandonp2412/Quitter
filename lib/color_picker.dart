import 'package:flutter/material.dart';
import 'package:quitter/utils.dart';

/// A grid of [Colors.primaries] swatches for selecting a single color.
///
/// The currently [selectedColor] is marked with an animated check mark.
/// Selecting a swatch invokes [onColorSelected]; the parent owns the state.
class ColorPickerWidget extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: Colors.primaries.map((color) {
        final bool isSelected = selectedColor.toARGB32() == color.toARGB32();
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(2, 2),
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
                color: getContrastingColor(color),
                size: 50,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
