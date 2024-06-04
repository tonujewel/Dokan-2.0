import 'package:dokan/src/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.dateCreated,
    required super.description,
    required super.price,
    required super.totalSales,
    required super.regularPrice,
    required super.averageRating,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        dateCreated: json["date_created"] ?? "",
        description: json["description"] ?? "",
        price: json["price"] ?? "",
        totalSales: json["totalSales"] ?? "",
        regularPrice: json["regular_price"] ?? "",
        averageRating: json["average_rating"] ?? "",
        images: json["images"] == null ? [] : List<ImageModel>.from(json["images"].map((x) => ImageModel.fromJson(x))),
      );
}

class ImageModel extends ImageEntity {
  const ImageModel({required super.id, required super.src});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"] ?? "",
        src: json["src"] ?? "",
      );
}
