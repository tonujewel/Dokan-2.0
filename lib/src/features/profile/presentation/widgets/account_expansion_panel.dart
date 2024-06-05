// import 'package:flutter/material.dart';

// class AccountExpansionPanel extends StatelessWidget {
//   const AccountExpansionPanel({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanel(
//       canTapOnHeader: true,
//       isExpanded: _controller.isAccountOpen,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
//         width: kWidth,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Email
//             const Text(
//               'Email',
//               style: TextStyle(
//                 color: Color(0xFF838C91),
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: kHeight * 0.02),
//             OutlineTextField(
//               enable: false,
//               hintText: 'youremail@xmail.com',
//               controller: _controller.emailTextController,
//             ),

//             SizedBox(height: kHeight * 0.03),

//             // user name
//             const Text(
//               'Username',
//               style: TextStyle(
//                 color: Color(0xFF838C91),
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: kHeight * 0.02),
//             OutlineTextField(
//               enable: false,
//               hintText: 'username',
//               controller: _controller.userNameTextController,
//             ),
//             SizedBox(height: kHeight * 0.03),
//             // First name
//             const Text(
//               'First name',
//               style: TextStyle(
//                 color: Color(0xFF838C91),
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: kHeight * 0.02),
//             OutlineTextField(
//               hintText: 'First Name',
//               controller: _controller.firstNameTextController,
//             ),
//             SizedBox(height: kHeight * 0.03),
//             // Apt, Suite, Bldg (optional)
//             const Text(
//               'Last Name',
//               style: TextStyle(
//                 color: Color(0xFF838C91),
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: kHeight * 0.02),
//             OutlineTextField(
//               hintText: 'Last Name',
//               controller: _controller.lastNameTextController,
//             ),
//             SizedBox(height: kHeight * 0.03),

//             Row(
//               children: [
//                 Flexible(
//                   child: GestureDetector(
//                     onTap: () => _controller.expandCollapsAction(
//                         _controller.isAccountOpen, 0),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: kHeight * 0.023),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(color: const Color(0xFF818995)),
//                           borderRadius: BorderRadius.circular(7)),
//                       width: kWidth,
//                       child: const Text(
//                         'Cancel',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontFamily: 'Roboto',
//                           fontWeight: FontWeight.w500,
//                           color: Color(0xFF818995),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: kWidth * 0.05),
//                 Flexible(
//                   child: CustomButton(
//                     backGroundColor: const Color(0xFF1ABC9C),
//                     onTap: () => _controller.updateUserInfo(),
//                     title: 'Save',
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//       headerBuilder: (BuildContext context, bool isExpanded) {
//         return Row(
//           children: [
//             SizedBox(width: kWidth * 0.05),
//             SvgPicture.asset(
//               'assets/svg/profile.svg',
//               height: kHeight * 0.035,
//               width: kHeight * 0.035,
//             ),
//             SizedBox(width: kWidth * 0.05),
//             const Text(
//               'Account',
//               style: TextStyle(fontSize: 18),
//             ),
//           ],
//         );
//       },
//     );
  
//   }
// }


