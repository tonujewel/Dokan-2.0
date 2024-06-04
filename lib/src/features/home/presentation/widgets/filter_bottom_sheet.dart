import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Container(
      height: kHeight * .5,
      width: kWidth,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: kHeight * 0.03),
          SvgPicture.asset('assets/svg/bottom_bar.svg'),
          SizedBox(height: kHeight * 0.03),
          Container(
            width: kWidth,
            padding: EdgeInsets.symmetric(horizontal: kWidth * .06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filter',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: kHeight * 0.02),
                // ListView.builder(
                //   padding: EdgeInsets.zero,
                //   shrinkWrap: true,
                //   itemCount: _controller.filterItems.length,
                //   itemBuilder: (context, index) {
                //     return GestureDetector(
                //       onTap: () => _controller.onFilterSelec(index),
                //       child: Padding(
                //         padding: EdgeInsets.only(bottom: kHeight * 0.02),
                //         child: Row(
                //           children: [
                //             SvgPicture.asset(
                //               _controller.filterItems[index].isSelected
                //                   ? 'assets/svg/checked.svg'
                //                   : 'assets/svg/unchecked.svg',
                //             ),
                //             SizedBox(width: kHeight * 0.02),
                //             Text(
                //               _controller.filterItems[index].name,
                //               style: const TextStyle(
                //                 fontFamily: 'Roboto',
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     );
                //   },
                // ),
                Padding(
                  padding: EdgeInsets.only(bottom: kHeight * 0.02),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/unchecked.svg',
                      ),
                      SizedBox(width: kHeight * 0.02),
                      const Text(
                        "name",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kHeight * 0.04),
                Row(
                  children: [
                    Flexible(
                      child: TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0), side: const BorderSide(color: Colors.black)),
                          ),
                          shadowColor: MaterialStateProperty.all(const Color(0xFFF75F55)),
                        ),
                        onPressed: () => context.pop(),
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Cancel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF818995),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: kWidth * 0.05),
                    Flexible(
                      child: CustomButton(
                        backGroundColor: const Color(0xFF1ABC9C),
                        onTap: () {
                          // Get.back();
                          // _controller.filterAction();
                        },
                        title: 'Apply',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
