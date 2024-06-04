import 'package:dokan/src/core/usecases/usecases.dart';
import 'package:dokan/src/core/utils/typedef.dart';
import 'package:dokan/src/features/home/domain/entities/product_entity.dart';
import 'package:dokan/src/features/home/domain/repositories/product_repository.dart';

class GetProductsUsecase extends UsecaseWithoutParams<List<ProductEntity>> {
  final ProductRepository repository;

  GetProductsUsecase({required this.repository});

  @override
  ResultFuture<List<ProductEntity>> call() async {
    return await repository.getProducts();
  }
}
