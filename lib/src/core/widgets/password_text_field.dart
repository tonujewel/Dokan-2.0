import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hints;

  const PasswordTextField({
    super.key,
    this.controller,
    this.textInputType,
    this.hints,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: height * 0.007),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x214d5877),
            offset: Offset(2, 3),
            blurRadius: 12,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: width * 0.05),
          SizedBox(
            height: height * 0.027,
            width: height * 0.027,
            child: SvgPicture.asset("assets/svg/lock.svg"),
          ),
          Flexible(
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: hidePassword,
              cursorColor: Colors.black,
              controller: widget.controller,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15, right: 15),
                hintText: widget.hints ?? "Password",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  color: Color(0xFFA4A9AF),
                ),
              ),
            ),
          ),
          IconButton(
            icon: hidePassword
                ? const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFA4A9AF),
                  )
                : const Icon(Icons.visibility, color: Color(0xFFA4A9AF)),
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
          )
        ],
      ),
    );
  }
}
