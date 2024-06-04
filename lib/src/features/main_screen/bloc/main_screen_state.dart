part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  final Widget selectedWidget;
  final int selectedIndex;

  const MainScreenState({
    required this.selectedWidget,
    required this.selectedIndex,
  });

  MainScreenState copyWith({
    Widget? selectedWidget,
    int? selectedIndex,
  }) {
    return MainScreenState(
      selectedWidget: selectedWidget ?? this.selectedWidget,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [selectedWidget, selectedIndex];
}


