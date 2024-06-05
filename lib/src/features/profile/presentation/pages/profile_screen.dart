import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../home/presentation/widgets/filter_bottom_sheet.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/outline_text_field.dart';
import '../widgets/user_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF8F8F8),
      body: BlocConsumer<ProfileBloc, ProfileInitial>(
        listener: (BuildContext context, ProfileInitial state) {
          
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: kHeight * 0.09),
                  SizedBox(width: kWidth),
                  const Text(
                    'My Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Roboto',
                      color: Color(0xFF222455),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  state.userEntity?.firstName == null
                      ? const SizedBox()
                      : UserSection(
                          firstName: "${state.userEntity?.firstName}",
                          lastName: "${state.userEntity?.lastName}",
                          emailAddress: "${state.userEntity?.email}",
                        ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: ExpansionPanelList(
                          animationDuration: const Duration(milliseconds: 300),
                          elevation: 0,
                          expansionCallback: (int index, bool isExpanded) {
                            context.read<ProfileBloc>().add(ExpansionCollapsAction(index: index, value: isExpanded));
                          },
                          children: [
                            accountExpantionPanel(state.isAccountOpen, kWidth, kHeight),
                            passwordExpantionPanel(state.isPasswordOpen, kWidth, kHeight),
                            notificationExpantionPanel(state.isNotificationOpen, kWidth, kHeight),
                            wishListExpantionPanel(state.isWishListOpen, kWidth, kHeight),
                          ]),
                    ),
                  ),
                  SizedBox(height: kHeight * 0.051),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ExpansionPanel accountExpantionPanel(bool isExpanded, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Email
            const Text(
              'Email',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              enable: false,
              hintText: 'youremail@xmail.com',
            ),

            SizedBox(height: kHeight * 0.03),

            // user name
            const Text(
              'Username',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              enable: false,
              hintText: 'username',
            ),
            SizedBox(height: kHeight * 0.03),
            // First name
            const Text(
              'First name',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              hintText: 'First Name',
            ),
            SizedBox(height: kHeight * 0.03),
            // Apt, Suite, Bldg (optional)
            const Text(
              'Last Name',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              hintText: 'Last Name',
            ),
            SizedBox(height: kHeight * 0.03),

            Row(
              children: [
                const Flexible(
                  child: CancelButton(),
                ),
                SizedBox(width: kWidth * 0.05),
                Flexible(
                  child: CustomButton(
                    backGroundColor: const Color(0xFF1ABC9C),
                    onTap: () {
                      //  _controller.updateUserInfo()
                    },
                    title: 'Save',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SizedBox(width: kWidth * 0.05),
              SvgPicture.asset(
                'assets/svg/profile.svg',
                height: kHeight * 0.035,
                width: kHeight * 0.035,
              ),
              SizedBox(width: kWidth * 0.05),
              const Text(
                'Account',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }

  ExpansionPanel passwordExpantionPanel(bool isExpanded, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // old
            const Text(
              'Old password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              hintText: 'xxxxxx',
              // controller: controller.emailTextController,
            ),
            SizedBox(height: kHeight * 0.02),
            // new password
            const Text(
              'New password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              hintText: 'xxxxxx',
              // controller: controller.emailTextController,
            ),
            SizedBox(height: kHeight * 0.02),
            // confrm password
            const Text(
              'Confirm password',
              style: TextStyle(
                color: Color(0xFF838C91),
                fontSize: 16,
              ),
            ),
            SizedBox(height: kHeight * 0.02),
            const OutlineTextField(
              hintText: 'xxxxxx',
              // controller: controller.emailTextController,
            ),

            SizedBox(height: kHeight * 0.02),
            Row(
              children: [
                const Flexible(
                  child: CancelButton(),
                ),
                SizedBox(width: kWidth * 0.05),
                Flexible(
                  child: CustomButton(
                    backGroundColor: const Color(0xFF1ABC9C),
                    onTap: () {
                      // => context.pop()
                    },
                    title: 'Save',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SizedBox(width: kWidth * 0.05),
              SvgPicture.asset(
                'assets/svg/lock.svg',
                height: kHeight * 0.035,
                width: kHeight * 0.035,
              ),
              SizedBox(width: kWidth * 0.05),
              const Text(
                'Password',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }

  ExpansionPanel notificationExpantionPanel(bool isExpanded, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.05),
            const Text(
              'Notification',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kHeight * 0.05),
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SizedBox(width: kWidth * 0.05),
              SvgPicture.asset(
                'assets/svg/notification.svg',
                height: kHeight * 0.035,
                width: kHeight * 0.035,
              ),
              SizedBox(width: kWidth * 0.05),
              const Text(
                'Notification',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      },
    );
  }

  ExpansionPanel wishListExpantionPanel(bool isExpanded, double kWidth, double kHeight) {
    return ExpansionPanel(
      canTapOnHeader: true,
      isExpanded: isExpanded,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        width: kWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.05),
            const Text(
              'Wishlist',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: kHeight * 0.05),
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SizedBox(width: kWidth * 0.05),
              SvgPicture.asset(
                'assets/svg/love.svg',
                height: kHeight * 0.035,
                width: kHeight * 0.035,
              ),
              SizedBox(width: kWidth * 0.05),
              const Row(
                children: [
                  Text(
                    'Wishlist ',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '(00)',
                    style: TextStyle(fontSize: 18, color: Color(0xFF7C8592)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
