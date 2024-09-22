import 'package:armazen/domain/entities/product_entity.dart';

import '../http/http.dart';
import 'remote_manufacturer_model.dart';
import 'generic_model.dart';

class RemoteProductModel extends GenericModel {
  final String name;

  final String description;

  final double price;

  final double costPrice;

  final double weight;

  final int purchaseQuantity;

  final int saleQuantity;

  final RemoteManufacturerModel manufacturer;

  RemoteProductModel({required this.name, required this.description, required this.price, required this.costPrice, required this.weight, required this.purchaseQuantity, required this.saleQuantity, required this.manufacturer, required super.id, required super.createdAt, required super.updatedAt});

  factory RemoteProductModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt', 'name', 'description', 'price', 'costaPrice', 'weight', 'purchaseQuantity', 'saleQuantity', 'manufacturer'])) {
      throw HttpError.invalidData;
    }

    return RemoteProductModel(
      name: json['name'],
      description: json['description'],
      price: json['price'],
      costPrice: json['costPrice'],
      weight: json['weight'],
      purchaseQuantity: json['purchaseQuantity'],
      saleQuantity: json['saleQuantity'],
      manufacturer: json['manufacturer'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  ProductEntity toEntity() => ProductEntity(
    name: name,
    description:
    description,
    price: price,
    costPrice:
    costPrice,
    weight: weight,
    purchaseQuantity: purchaseQuantity,
    saleQuantity: saleQuantity,
    manufacturer: manufacturer.toEntity(),
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );
}