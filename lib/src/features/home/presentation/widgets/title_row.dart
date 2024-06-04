import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          'Product list',
          style: TextStyle(fontSize: 22, fontFamily: 'Roboto', color: Color(0xFF222455), fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/svg/search.svg',
          colorFilter: const ColorFilter.mode(Color(0xFF222455), BlendMode.srcIn),
        ),
      ],
    );
  }
}
