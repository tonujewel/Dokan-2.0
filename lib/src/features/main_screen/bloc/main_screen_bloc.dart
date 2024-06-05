
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/cart_screen.dart';
import '../../category/category_screen.dart';
import '../../home/presentation/pages/home_screen.dart';
import '../../profile/presentation/pages/profile_screen.dart';
import '../../search/search_screen.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(const MainScreenState(selectedWidget: HomeScreen(), selectedIndex: 0)) {
    on<BottomItemClickEvent>(_bottomNavigationOnChange);
  }
  void _bottomNavigationOnChange(BottomItemClickEvent event, Emitter emit) {
    Widget selectedWidget;
    switch (event.index) {
      case 0:
        selectedWidget = const HomeScreen();
        break;
      case 1:
        selectedWidget = const CategoryScreen();
        break;
      case 2:
        selectedWidget = const SearchScreen();
        break;
      case 3:
        selectedWidget = const CartScreen();
        break;
      case 4:
        selectedWidget = const ProfileScreen();
        break;
      default:
        selectedWidget = const HomeScreen();
    }
    emit(state.copyWith(
      selectedWidget: selectedWidget,
      selectedIndex: event.index,
    ));
  }
}
