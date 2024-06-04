import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomItem extends StatelessWidget {
  const BottomItem({
    super.key,
    this.onTap,
    required this.svgPath,
    required this.isSelected,
  });

  final Function()? onTap;
  final String svgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 40,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      color: Colors.amber,
      icon: SvgPicture.asset(
        svgPath,
        colorFilter: ColorFilter.mode(isSelected ? const Color(0xFFF75F55) : const Color(0xFF6E7FAA), BlendMode.srcIn),
      ),
    );
  }
}
