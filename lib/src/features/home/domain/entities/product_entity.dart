import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final String dateCreated;
  final String description;
  final String price;
  final String totalSales;
  final String regularPrice;
  final String averageRating;
  final List<ImageEntity> images;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.dateCreated,
    required this.description,
    required this.price,
    required this.totalSales,
    required this.regularPrice,
    required this.averageRating,
    required this.images,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        dateCreated,
        description,
        price,
        totalSales,
        regularPrice,
        averageRating,
        images,
      ];

  bool discountVisible() {
    if (regularPrice == price) {
      return false;
    } else if (regularPrice == '') {
      return false;
    } else {
      return true;
    }
  }

  String imageUrl() {
    if (images.isNotEmpty) {
      return images.first.src;
    } else {
      return "";
    }
  }
}

class ImageEntity extends Equatable {
  final int id;
  final String src;

  const ImageEntity({required this.id, required this.src});
  @override
  List<Object?> get props => [id, src];
}
