import 'manufacturer_entity.dart';
import 'generic_entity.dart';

class ProductEntity extends GenericEntity {
  final String name;

  final String description;

  final double price;

  final double costPrice;

  final double weight;

  final int purchaseQuantity;

  final int saleQuantity;

  final ManufacturerEntity manufacturer;

  @override
  List get props => [id, createdAt, updatedAt, name, description, price, costPrice, weight, purchaseQuantity, saleQuantity, manufacturer];

  const ProductEntity({required this.name, required this.description, required this.price, required this.costPrice, required this.weight, required this.purchaseQuantity, required this.saleQuantity, required this.manufacturer, required super.id, required super.createdAt, required super.updatedAt});
}