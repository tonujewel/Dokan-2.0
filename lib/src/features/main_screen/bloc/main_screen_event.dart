part of 'main_screen_bloc.dart';

sealed class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object> get props => [];
}

class BottomItemClickEvent extends MainScreenEvent {
  final int index;

  const BottomItemClickEvent({required this.index});
}
