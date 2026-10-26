import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddictionIcon extends StatelessWidget {
  const AddictionIcon(this.icon, {super.key, this.size = 24, this.color});

  final IconData icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (icon == Icons.air) {
      return SvgPicture.asset(
        'assets/vaping.svg',
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
