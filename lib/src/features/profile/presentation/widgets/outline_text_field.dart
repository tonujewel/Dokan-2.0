import 'package:flutter/material.dart';

class OutlineTextField extends StatelessWidget {
  const OutlineTextField({super.key, required this.hintText, this.controller, this.enable, this.maxLines});

  final String hintText;
  final TextEditingController? controller;
  final bool? enable;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      enabled: enable == null ? true : false,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        // hintText: ,
        alignLabelWithHint: true,
        hintStyle: const TextStyle(color: Color(0xFFB9BDBF)),
        hintText: hintText,
        border: myinputborder(),
        enabledBorder: myinputborder(),
        focusedBorder: myinputborder(),
        labelStyle: const TextStyle(color: Colors.black),
        contentPadding: EdgeInsets.symmetric(
          vertical: maxLines == null ? 0 : 15,
          horizontal: 15,
        ),
      ),
    );
  }
}

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return const OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Color(0xFFE5E6E7)));
}
