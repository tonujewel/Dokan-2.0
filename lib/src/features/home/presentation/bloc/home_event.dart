part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GerProductEvent extends HomeEvent {}

class ApplyFilterEvent extends HomeEvent {
  const ApplyFilterEvent();
}

class FilterOnChangeEvent extends HomeEvent {
  final String title;

  const FilterOnChangeEvent({required this.title});

  @override
  List<Object> get props => [title];
}
