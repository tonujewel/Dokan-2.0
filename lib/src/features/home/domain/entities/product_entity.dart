import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String dateCreated;
  final String description;
  final String price;
  final String totalSales;

  const ProductEntity(
      {required this.name,
      required this.dateCreated,
      required this.description,
      required this.price,
      required this.totalSales});
  @override
  List<Object?> get props => [name, dateCreated, description, price, totalSales];
}
