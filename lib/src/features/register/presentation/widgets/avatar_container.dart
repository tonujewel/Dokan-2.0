import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarContainer extends StatelessWidget {
  const AvatarContainer({super.key, required this.kHeight});
  final double kHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: kHeight * .15,
          height: kHeight * .15,
          padding: EdgeInsets.all(kHeight * 0.055),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x1a395ab8),
                offset: Offset(0, 3),
                blurRadius: 8,
              ),
            ],
          ),
          child: SvgPicture.asset('assets/svg/profile.svg'),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: kHeight * 0.04,
            width: kHeight * 0.04,
            padding: EdgeInsets.all(kHeight * 0.01),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              gradient: LinearGradient(
                begin: Alignment(1.91, 0.08),
                end: Alignment(0.07, -1.0),
                colors: [Color(0xfff2709c), Color(0xffff9472)],
                stops: [0.0, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x408b2f40),
                  offset: Offset(0, 14),
                  blurRadius: 46,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'assets/svg/camera.svg',
            ),
          ),
        ),
      ],
    );
  }
}
