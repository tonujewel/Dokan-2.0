import 'package:dokan/src/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.name,
    required super.dateCreated,
    required super.description,
    required super.price,
    required super.totalSales,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"] ?? "",
        dateCreated: json["date_created"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? "",
        totalSales: json["totalSales"] ?? "",
      );
}
