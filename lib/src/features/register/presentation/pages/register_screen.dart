import 'package:dokan/src/core/utils/dialog_helper.dart';
import 'package:dokan/src/features/register/data/datasources/register_req.dart';
import 'package:dokan/src/features/register/presentation/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/vertical_margin.dart';
import '../../../login/presentation/pages/login_screen.dart';
import '../widgets/avatar_container.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogHelper.showLoading(context);
        }

        if (state is RegisterSuccessState) {
          DialogHelper.hideLoading(context);
          DialogHelper.successDialog(context, "Registration Success");
        }

        if (state is RegisterError) {
          DialogHelper.hideLoading(context);
          DialogHelper.errorDialog(context, state.msg);
        }
        if (state is RegisterValidationError) {
          DialogHelper.errorDialog(context, state.msg);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F8F8),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerticalMargin(height: 60),
                AvatarContainer(kHeight: kHeight),
                const VerticalMargin(height: 60),
                CustomTextField(
                  controller: nameController,
                  hints: 'Username',
                  svgPath: 'assets/svg/profile.svg',
                ),
                SizedBox(height: kHeight * 0.02),
                CustomTextField(
                  controller: emailController,
                  hints: 'Email',
                  svgPath: 'assets/svg/sms.svg',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(height: kHeight * 0.02),
                CustomTextField(
                  controller: passwordController,
                  hints: 'Password',
                  svgPath: 'assets/svg/lock.svg',
                  inputType: TextInputType.visiblePassword,
                  obscure: true,
                ),
                SizedBox(height: kHeight * 0.02),
                CustomTextField(
                  obscure: true,
                  controller: confirmPassword,
                  hints: 'Confirm Password',
                  svgPath: 'assets/svg/lock.svg',
                  inputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: kHeight * 0.045),
                CustomButton(
                  onTap: () => context.read<RegisterBloc>().add(
                        DoSignupValidationEvent(
                          req: RegisterReq(
                              username: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: confirmPassword.text),
                        ),
                      ),
                  title: 'Sign Up',
                ),
                SizedBox(height: kHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(iconPath: 'assets/svg/facebook.svg', onTap: () {}),
                    const HorizontalMargin(),
                    SocialButton(iconPath: 'assets/svg/google.svg', onTap: () {})
                  ],
                ),
                SizedBox(height: kHeight * 0.03),
                GestureDetector(
                  onTap: () => context.pop(),
                  child: RichText(
                    text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                            fontFamily: 'Roboto', color: Color(0xff383C40), fontSize: 17, fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xff2893E3),
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
