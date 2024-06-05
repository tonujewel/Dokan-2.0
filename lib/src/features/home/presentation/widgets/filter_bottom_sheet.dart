import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_button.dart';
import '../bloc/home_bloc.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBloc, HomeLoadedState>(
      builder: (context, state) {
        return Container(
          width: kWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: state.filterItems.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.read<HomeBloc>().add(FilterOnChangeEvent(title: state.filterItems[index].name));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: kHeight * 0.02),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  state.filterItems[index].isSelected
                                      ? 'assets/svg/checked.svg'
                                      : 'assets/svg/unchecked.svg',
                                ),
                                SizedBox(width: kHeight * 0.02),
                                Text(
                                  state.filterItems[index].name,
                                  style: const TextStyle(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: kHeight * 0.04),
                    Row(
                      children: [
                        Flexible(
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  side: const BorderSide(color: Colors.black),
                                ),
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
                              context.pop();
                              context.read<HomeBloc>().add(const ApplyFilterEvent());
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
      },
    );
  }
}
