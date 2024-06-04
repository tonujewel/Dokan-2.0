import 'package:dokan/src/core/config/route_constant.dart';
import 'package:dokan/src/core/utils/dialog_helper.dart';
import 'package:dokan/src/core/widgets/vertical_margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userNameController = TextEditingController(text: "tonujewel");
  final passwordController = TextEditingController(text: "12345");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginLoadingState) {
          DialogHelper.showLoading(context);
        }

        if (state is LoginErrorState) {
          DialogHelper.hideLoading(context);
          DialogHelper.errorDialog(context, state.msg);
        }

        if (state is LoginSuccessState) {
          DialogHelper.hideLoading(context);

          context.go(RouteConstant.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFFF8F8F8),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalMargin(height: 100),
                Center(child: SvgPicture.asset('assets/svg/logo.svg')),
                const VerticalMargin(height: 30),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const VerticalMargin(height: 60),
                CustomTextField(
                  controller: userNameController,
                  hints: 'Username',
                  svgPath: 'assets/svg/profile.svg',
                ),
                const VerticalMargin(),
                CustomTextField(
                  controller: passwordController,
                  hints: 'Password',
                  obscure: true,
                  inputType: TextInputType.visiblePassword,
                  svgPath: 'assets/svg/lock.svg',
                ),
                const VerticalMargin(),
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
                const VerticalMargin(),
                CustomButton(
                  onTap: () {
                    context.read<LoginBloc>().add(
                          DoLoginEvent(
                            req: LoginReq(username: userNameController.text, password: passwordController.text),
                          ),
                        );
                  },
                  title: 'Login',
                ),
                const VerticalMargin(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(iconPath: 'assets/svg/facebook.svg', onTap: () {}),
                    const HorizontalMargin(),
                    SocialButton(iconPath: 'assets/svg/google.svg', onTap: () {}),
                  ],
                ),
                const VerticalMargin(),
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
