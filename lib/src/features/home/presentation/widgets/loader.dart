import 'package:flutter/material.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.asset(
            "assets/images/loader.gif",
            scale: 6,
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          ),
        ),
      ),
    );
  }
}
