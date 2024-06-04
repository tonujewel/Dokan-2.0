import 'package:flutter/material.dart';

class VerticalMargin extends StatelessWidget {
  const VerticalMargin({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 16,
    );
  }
}

class HorizontalMargin extends StatelessWidget {
  const HorizontalMargin({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 16,
    );
  }
}
