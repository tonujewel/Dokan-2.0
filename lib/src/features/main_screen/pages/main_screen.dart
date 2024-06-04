import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/main_screen_bloc.dart';
import '../widgets/bottom_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: state.selectedWidget,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.amber,
            shape: const CircleBorder(),
            onPressed: () {
              context.read<MainScreenBloc>().add(const BottomItemClickEvent(index: 2));
            },
            child: Container(
              width: kWidth,
              height: kHeight,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                gradient: LinearGradient(
                  begin: Alignment(-1.0, 1.46),
                  end: Alignment(1.0, 1.46),
                  colors: [
                    Color(0xffff679b),
                    Color(0xffff7b51),
                  ],
                  stops: [0.0, 1.0],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x25b82d48),
                    offset: Offset(0, 12),
                    blurRadius: 56,
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/svg/search.svg'),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            notchMargin: 8,
            shape: const CircularNotchedRectangle(),
            surfaceTintColor: Colors.white,
            elevation: 8,
            shadowColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20.0,
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomItem(
                    isSelected: state.selectedIndex == 0,
                    onTap: () {
                      context.read<MainScreenBloc>().add(const BottomItemClickEvent(index: 0));
                    },
                    svgPath: 'assets/svg/home.svg',
                  ),
                  BottomItem(
                    isSelected: state.selectedIndex == 1,
                    onTap: () => context.read<MainScreenBloc>().add(const BottomItemClickEvent(index: 1)),
                    svgPath: 'assets/svg/category.svg',
                  ),
                  const SizedBox(width: 60.0),
                  BottomItem(
                    isSelected: state.selectedIndex == 3,
                    onTap: () => context.read<MainScreenBloc>().add(const BottomItemClickEvent(index: 3)),
                    svgPath: 'assets/svg/cart.svg',
                  ),
                  BottomItem(
                    isSelected: state.selectedIndex == 4,
                    onTap: () => context.read<MainScreenBloc>().add(const BottomItemClickEvent(index: 4)),
                    svgPath: 'assets/svg/profile.svg',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
