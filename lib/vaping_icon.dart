import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VapingIcon extends StatelessWidget {
  const VapingIcon({super.key, this.size = 32, this.color = Colors.white});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/vaping.svg',
    width: size,
    height: size,
    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
  );
}
