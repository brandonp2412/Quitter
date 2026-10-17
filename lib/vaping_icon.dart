import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Adapted from https://www.svgrepo.com/svg/138430/electronic-cigarette (CC0).
class VapingIcon extends StatelessWidget {
  const VapingIcon({super.key, this.size = 24, this.color = Colors.white});

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
