import '../../../../core/utils/typedef.dart';
import '../entities/product_entity.dart';

abstract class ProductRepository {
  ResultFuture<List<ProductEntity>> getProducts();
}
