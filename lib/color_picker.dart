import 'package:flutter/material.dart';
import 'package:quitter/utils.dart';
import 'package:quitter/l10n/generated/app_localizations.dart';

Future<Color?> showCustomColorPickerDialog(
  BuildContext context,
  Color initialColor,
) => showDialog<Color>(
  context: context,
  builder: (context) => _CustomColorDialog(initialColor: initialColor),
);

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final customLabel = '${l10n.addAddictionCustom} ${l10n.editEntryColor}';
    final customSelected = !Colors.primaries.any(
      (color) => color.toARGB32() == selectedColor.toARGB32(),
    );

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final color in Colors.primaries)
          _swatch(
            color: color,
            selected: selectedColor.toARGB32() == color.toARGB32(),
            label: l10n.editEntryColor,
            onTap: () => onColorSelected(color),
          ),
        Tooltip(
          message: customLabel,
          child: InkWell(
            key: const Key('customColorSwatch'),
            borderRadius: BorderRadius.circular(35),
            onTap: () async {
              final color = await showCustomColorPickerDialog(
                context,
                selectedColor,
              );
              if (color != null) onColorSelected(color);
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: customSelected
                    ? null
                    : const SweepGradient(
                        colors: [
                          Colors.red,
                          Colors.yellow,
                          Colors.green,
                          Colors.cyan,
                          Colors.blue,
                          Colors.purple,
                          Colors.red,
                        ],
                      ),
                color: customSelected ? selectedColor : null,
                border: Border.all(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  width: 2,
                ),
              ),
              child: Icon(
                customSelected ? Icons.check : Icons.palette_outlined,
                color: customSelected
                    ? getContrastingColor(selectedColor)
                    : Colors.white,
                size: 32,
                shadows: customSelected
                    ? null
                    : const [Shadow(color: Colors.black87, blurRadius: 6)],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _swatch({
    required Color color,
    required bool selected,
    required String label,
    required VoidCallback onTap,
  }) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: onTap,
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: selected
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
            scale: selected ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.elasticOut,
            child: Icon(
              Icons.check,
              color: getContrastingColor(color),
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomColorDialog extends StatefulWidget {
  const _CustomColorDialog({required this.initialColor});

  final Color initialColor;

  @override
  State<_CustomColorDialog> createState() => _CustomColorDialogState();
}

class _CustomColorDialogState extends State<_CustomColorDialog> {
  late HSVColor _hsv;
  late TextEditingController _hexController;
  bool _validHex = true;

  @override
  void initState() {
    super.initState();
    _hsv = HSVColor.fromColor(widget.initialColor);
    _hexController = TextEditingController(text: _hex(_hsv.toColor()));
  }

  @override
  void dispose() {
    _hexController.dispose();
    super.dispose();
  }

  static String _hex(Color color) =>
      '#${(color.toARGB32() & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';

  static Color? _parseHex(String value) {
    final hex = value.trim().replaceFirst('#', '');
    if (!RegExp(r'^[0-9a-fA-F]{6}$').hasMatch(hex)) return null;
    return Color(0xFF000000 | int.parse(hex, radix: 16));
  }

  void _setColor(HSVColor value) {
    setState(() {
      _hsv = value;
      _validHex = true;
      _hexController.text = _hex(value.toColor());
    });
  }

  void _setSaturationValue(Offset position, Size size) {
    _setColor(
      _hsv
          .withSaturation((position.dx / size.width).clamp(0.0, 1.0))
          .withValue((1 - position.dy / size.height).clamp(0.0, 1.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MaterialLocalizations.of(context);
    final appL10n = AppLocalizations.of(context)!;
    final color = _hsv.toColor();
    return AlertDialog(
      title: Text('${appL10n.addAddictionCustom} ${appL10n.editEntryColor}'),
      content: SizedBox(
        width: 380,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  const height = 220.0;
                  return GestureDetector(
                    key: const Key('saturationValuePicker'),
                    onPanDown: (details) => _setSaturationValue(
                      details.localPosition,
                      Size(width, height),
                    ),
                    onPanUpdate: (details) => _setSaturationValue(
                      details.localPosition,
                      Size(width, height),
                    ),
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: CustomPaint(
                              painter: _SaturationValuePainter(
                                hue: HSVColor.fromAHSV(
                                  1,
                                  _hsv.hue,
                                  1,
                                  1,
                                ).toColor(),
                              ),
                            ),
                          ),
                          Positioned(
                            left: (_hsv.saturation * width - 10).clamp(
                              0.0,
                              width - 20,
                            ),
                            top: ((1 - _hsv.value) * height - 10).clamp(
                              0.0,
                              height - 20,
                            ),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Icon(Icons.palette_outlined),
                  Expanded(
                    child: Slider(
                      key: const Key('hueSlider'),
                      value: _hsv.hue,
                      min: 0,
                      max: 360,
                      onChanged: (hue) => _setColor(_hsv.withHue(hue)),
                    ),
                  ),
                  CircleAvatar(backgroundColor: color, radius: 16),
                ],
              ),
              const SizedBox(height: 12),
              TextField(
                key: const Key('hexColorField'),
                controller: _hexController,
                autocorrect: false,
                textCapitalization: TextCapitalization.characters,
                maxLength: 7,
                decoration: InputDecoration(
                  labelText: appL10n.editEntryColor,
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _validHex
                          ? Theme.of(context).colorScheme.outline
                          : Theme.of(context).colorScheme.error,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _validHex
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.error,
                      width: 2,
                    ),
                  ),
                  counterText: '',
                ),
                onChanged: (value) {
                  final parsed = _parseHex(value);
                  setState(() {
                    _validHex = parsed != null;
                    if (parsed != null) _hsv = HSVColor.fromColor(parsed);
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancelButtonLabel),
        ),
        FilledButton(
          key: const Key('applyCustomColor'),
          onPressed: _validHex
              ? () => Navigator.of(context).pop(_hsv.toColor())
              : null,
          child: Text(l10n.okButtonLabel),
        ),
      ],
    );
  }
}

class _SaturationValuePainter extends CustomPainter {
  const _SaturationValuePainter({required this.hue});

  final Color hue;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          colors: [Colors.white, hue],
        ).createShader(rect),
    );
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant _SaturationValuePainter oldDelegate) =>
      hue != oldDelegate.hue;
}
