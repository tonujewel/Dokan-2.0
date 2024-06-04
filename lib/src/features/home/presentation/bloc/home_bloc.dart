import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeLoadedState> {
  final GetProductsUsecase usecase;
  HomeBloc(this.usecase) : super(HomeLoadedState()) {
    on<GerProductEvent>(_getProducts);
  }

  Future<void> _getProducts(GerProductEvent event, Emitter emit) async {
    try {
      final result = await usecase.call();

      result.fold(
        (l) => log("message"),
        (r) => emit(state.copyWith(products: r)),
      );
    } catch (e) {
      // emit(state.copyWith(status: PostStatus.error, errorMessage: "failed to fetch posts"));
    }
  }
}
