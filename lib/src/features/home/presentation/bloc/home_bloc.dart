import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_constant.dart';
import '../../domain/entities/filter_dm.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeLoadedState> {
  final GetProductsUsecase usecase;
  HomeBloc(this.usecase) : super(const HomeLoadedState()) {
    on<GerProductEvent>(_getProducts);
    on<ApplyFilterEvent>(_filterApply);
    on<FilterOnChangeEvent>(_filterOnChange);
  }

  Future<void> _getProducts(GerProductEvent event, Emitter emit) async {
    try {
      final result = await usecase.call();

      result.fold(
        (l) => emit(state.copyWith(error: "Something went wrong")),
        (r) => emit(state.copyWith(products: r, filterItems: AppConstant.filterItems)),
      );
    } catch (e) {
      emit(state.copyWith(error: "Something went wrong"));
    }
  }

  void _filterApply(ApplyFilterEvent event, Emitter<HomeState> emit) {
    final currentState = state;
    String title = "";

    for (var data in currentState.filterItems) {
      if (data.isSelected == true) {
        title = data.name;
      }
    }

    if (title == "Newest") {
      final sortedProducts = List<ProductEntity>.from(currentState.products)
        ..sort((a, b) => DateTime.parse(b.dateCreated).compareTo(DateTime.parse(a.dateCreated)));
      emit(currentState.copyWith(products: sortedProducts));
    } else if (title == "Oldest") {
      final sortedProducts = List<ProductEntity>.from(currentState.products)
        ..sort((a, b) => DateTime.parse(a.dateCreated).compareTo(DateTime.parse(b.dateCreated)));
      emit(currentState.copyWith(products: sortedProducts));
    } else if (title == "Price low > High") {
      final sortedProducts = List<ProductEntity>.from(currentState.products)
        ..sort((a, b) => double.parse(a.price).compareTo(double.parse(b.price)));
      emit(currentState.copyWith(products: sortedProducts));
    } else if (title == "Price high > Low") {
      final sortedProducts = List<ProductEntity>.from(currentState.products)
        ..sort((a, b) => double.parse(b.price).compareTo(double.parse(a.price)));
      emit(currentState.copyWith(products: sortedProducts));
    } else if (title == "Best selling") {
      final sortedProducts = List<ProductEntity>.from(currentState.products)
        ..sort((a, b) => int.parse(b.totalSales).compareTo(int.parse(a.totalSales)));
      emit(currentState.copyWith(products: sortedProducts));
    }
  }

  void _filterOnChange(FilterOnChangeEvent event, Emitter<HomeState> emit) {
    final currentState = state;

    final updatedFilterItems = currentState.filterItems.map((filterItem) {
      if (filterItem.name == event.title) {
        return filterItem.copyWith(isSelected: true);
      } else {
        return filterItem.copyWith(isSelected: false);
      }
    }).toList();

    emit(currentState.copyWith(filterItems: updatedFilterItems));
  }
}
