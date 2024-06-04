import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_data_src.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSrc dataSrc;

  ProductRepositoryImpl({required this.dataSrc});
  @override
  ResultFuture<List<ProductEntity>> getProducts() async {
    try {
      final result = await dataSrc.getProducts();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
