import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../domain/entities/login_req.dart';
import '../bloc/login_bloc.dart';
import '../widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
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
                  onTap: () {
                    context.read<LoginBloc>().add(
                          DoLoginEvent(
                            req: LoginReq(username: "tonujewel", password: "12345"),
                          ),
                        );
                  },
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
      },
    );
  }
}
