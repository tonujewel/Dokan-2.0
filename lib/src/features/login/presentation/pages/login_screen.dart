import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kWidth * .07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.1),
            Center(child: SvgPicture.asset('assets/svg/logo.svg')),
            SizedBox(height: kHeight * 0.107),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: kHeight * 0.05),
            const CustomTextField(
              // controller: _controller.userNameTextController,
              hints: 'Username',
              svgPath: 'assets/svg/profile.svg',
            ),
            SizedBox(height: kHeight * 0.03),
            const CustomTextField(
              // controller: _controller.passwordController,
              hints: 'Password',
              obscure: true,
              inputType: TextInputType.visiblePassword,
              svgPath: 'assets/svg/lock.svg',
            ),
            SizedBox(height: kHeight * 0.02),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA4A9AF),
                  ),
                ),
              ],
            ),
            SizedBox(height: kHeight * 0.045),
            CustomButton(
              onTap: () {},
              title: 'Login',
            ),
            SizedBox(height: kHeight * 0.056),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(iconPath: 'assets/svg/facebook.svg', onTap: () {}),
                SizedBox(width: kWidth * 0.027),
                SocialButton(iconPath: 'assets/svg/google.svg', onTap: () {}),
              ],
            ),
            SizedBox(height: kHeight * 0.065),
            GestureDetector(
              child: const Text(
                'Create New Account',
                style: TextStyle(color: Color(0xff383C40), fontSize: 17, fontWeight: FontWeight.w300),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.iconPath, required this.onTap});

  final String iconPath;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x1a395ab8),
              offset: Offset(0, 3),
              blurRadius: 8,
            ),
          ],
        ),
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
