import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backGroundColor,
  });

  final Function() onTap;
  final String title;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          backGroundColor ?? const Color(0xFFF75F55),
        ),
        shadowColor: MaterialStateProperty.all(backGroundColor ?? const Color(0xFFF75F55)),
      ),
      onPressed: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
