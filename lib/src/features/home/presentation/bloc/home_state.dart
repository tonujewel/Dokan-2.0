part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// class HomeLoadedState extends HomeState {
//   final List<ProductEntity> products;
//   final List<FilterDm> filterItems;
//   final String error;

//   const HomeLoadedState({this.products = const [], this.error = "", this.filterItems = const []});

//   HomeLoadedState copyWith({
//     List<ProductEntity>? products,
//     List<FilterDm>? filterItems,
//     String? error,
//   }) {
//     return HomeLoadedState(
//       products: products ?? this.products,
//       error: error ?? "",
//       filterItems: filterItems ?? [],
//     );
//   }
// }
class HomeLoadedState extends HomeState {
  final List<ProductEntity> products;
  final List<FilterDm> filterItems;
  final String error;

  const HomeLoadedState({
    this.products = const [],
    this.error = "",
    this.filterItems = const [],
  });

  HomeLoadedState copyWith({
    List<ProductEntity>? products,
    List<FilterDm>? filterItems,
    String? error,
  }) {
    return HomeLoadedState(
      products: products ?? this.products,
      error: error ?? this.error,
      filterItems: filterItems ?? this.filterItems,
    );
  }

  @override
  List<Object> get props => [products, filterItems, error];
}
