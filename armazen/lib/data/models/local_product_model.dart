import 'package:armazen/domain/entities/product_entity.dart';

import '../http/http.dart';
import 'models.dart';
import 'generic_model.dart';

class LocalProductModel extends GenericModel {
  String _name;

  String _description;

  double _price;
  
  double _costPrice;

  double _weight;

  int _purchaseQuantity;

  int _saleQuantity;

  LocalManufacturerModel _manufacturer;

  LocalProductModel({required String name, required String description, required double price, required double costPrice, required double weight, required int purchaseQuantity, required int saleQuantity, required LocalManufacturerModel manufacturer, required super.id, required super.createdAt, required super.updatedAt}) :
    _name = name,
    _description = description,
    _price = price,
    _costPrice = costPrice,
    _weight = weight,
    _purchaseQuantity = purchaseQuantity,
    _saleQuantity = saleQuantity,
    _manufacturer = manufacturer;

  factory LocalProductModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt', 'name', 'description', 'price', 'costaPrice', 'weight', 'purchaseQuantity', 'saleQuantity', 'manufacturer'])) {
      throw HttpError.invalidData;
    }

    return LocalProductModel(
      name: json['nome'],
      description: json['descricao'],
      price: json['preco'],
      costPrice: json['precoCusto'],
      weight: json['peso'],
      purchaseQuantity: json['quantidadeCompra'],
      saleQuantity: json['quantidadeVenda'],
      manufacturer: json['fabricante'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }
  
  factory LocalProductModel.fromEntity(ProductEntity entity) => LocalProductModel(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    name: entity.name,
    description: entity.description,
    price: entity.price,
    costPrice: entity.costPrice,
    weight: entity.weight,
    purchaseQuantity: entity.purchaseQuantity,
    saleQuantity: entity.saleQuantity,
    manufacturer: LocalManufacturerModel.fromEntity(entity.manufacturer)
  );

  ProductEntity toEntity() => ProductEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    costPrice: costPrice,
    description: description,
    manufacturer: manufacturer.toEntity(),
    name: name,
    price: price,
    purchaseQuantity: purchaseQuantity,
    saleQuantity: saleQuantity,
    weight: weight
  );

  Map toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'costPrice': costPrice,
    'weight': weight,
    'purchaseQuantity': purchaseQuantity,
    'saleQuantity': saleQuantity,
    'manufacturer': manufacturer,
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt
  };
    
  get name => _name;
  set name( value) => _name = value;

  get description => _description;
  set description( value) => _description = value;

  get price => _price;
  set price( value) => _price = value;

  get costPrice => _costPrice;
  set costPrice( value) => _costPrice = value;

  get weight => _weight;
  set weight( value) => _weight = value;

  get purchaseQuantity => _purchaseQuantity;
  set purchaseQuantity( value) => _purchaseQuantity = value;

  get saleQuantity => _saleQuantity;
  set saleQuantity( value) => _saleQuantity = value;

  get manufacturer => _manufacturer;
  set manufacturer( value) => _manufacturer = value;
}