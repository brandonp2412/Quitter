import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quitter/preset_icons.dart';

class AddictionIcon extends StatelessWidget {
  const AddictionIcon(this.icon, {super.key, this.size = 24, this.color});

  final IconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final asset = switch (icon) {
      Icons.air => 'assets/vaping.svg',
      PresetIcons.gabapentin => 'assets/gabapentin.svg',
      PresetIcons.opioids => 'assets/opioids.svg',
      PresetIcons.meth => 'assets/meth.svg',
      PresetIcons.maoi => 'assets/maoi.svg',
      _ => null,
    };
    if (asset != null) {
      return SvgPicture.asset(
        asset,
        width: size * 4 / 3,
        height: size * 4 / 3,
        colorFilter: ColorFilter.mode(
          color ?? IconTheme.of(context).color ?? Colors.white,
          BlendMode.srcIn,
        ),
      );
    }

    return Icon(icon, size: size, color: color);
  }
}
