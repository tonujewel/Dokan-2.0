import 'package:flutter/material.dart';

import 'dot_border_painter.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key, required this.firstName, required this.lastName, required this.emailAddress});

  final String firstName, lastName, emailAddress;

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: kHeight * 0.05),
        CustomPaint(
          painter: DashedBorderPainter(
            strokeWidth: 1,
            dashSpacing: 8,
            color: const Color(0xFFF75F55),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: ClipOval(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: kHeight * 0.03),
        Text(
          '$firstName $lastName',
          style: const TextStyle(fontSize: 25, fontFamily: 'Roboto', color: Colors.black, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: kHeight * 0.01),
        Text(
          emailAddress,
          style: const TextStyle(
              // fontSize: 25,
              fontFamily: 'Roboto',
              color: Color(0xFF535353),
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: kHeight * 0.051),
      ],
    );
  }
}
