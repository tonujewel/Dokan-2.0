part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// final class HomeInitial extends HomeState {}

// final class HomeLoadingState extends HomeState {}

class HomeLoadedState {
  final List<ProductEntity> products;

  HomeLoadedState({this.products = const []});

  HomeLoadedState copyWith({List<ProductEntity>? products}) {
    return HomeLoadedState(products: products ?? this.products);
  }
}
