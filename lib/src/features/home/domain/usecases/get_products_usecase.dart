import 'package:dokan/src/core/usecases/usecases.dart';
import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/home/domain/repositories/product_repository.dart';

class GetProductsUsecase extends UsecaseWithoutParams {
  final ProductRepository repository;

  GetProductsUsecase({required this.repository});
  @override
  ResultFuture call() async {
    return await repository.getProducts();
  }
}
