import '../../domain/entities/manufacturer_entity.dart';
import '../http/http.dart';
import './generic_model.dart';
import 'local_address_model.dart';

class LocalManufacturerModel extends GenericModel {
  final String tradeName;

  final String corporateName;

  final String cnpj;

  final LocalAddressModel address;

  final String phone;

  final String email;

  LocalManufacturerModel({required this.tradeName, required this.corporateName, required this.cnpj, required this.address, required this.phone, required this.email, required super.id, required super.createdAt, required super.updatedAt});

  factory LocalManufacturerModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt', 'tradeName', 'corporateName', 'cnpj', 'address', 'phone', 'email'])) {
      throw HttpError.invalidData;
    }

    return LocalManufacturerModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      tradeName: json['tradeName'],
      corporateName: json['corporateName'],
      cnpj: json['cnpj'],
      address: json['address'],
      phone: json['phone'],
      email: json['email']
    );
  }
  
  factory LocalManufacturerModel.fromEntity(ManufacturerEntity entity) => LocalManufacturerModel(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt,
    tradeName: entity.tradeName,
    corporateName: entity.corporateName,
    cnpj: entity.cnpj,
    address: LocalAddressModel.fromEntity(entity.address),
    phone: entity.phone,
    email: entity.email
  );

  ManufacturerEntity toEntity() => ManufacturerEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt,
    address: address.toEntity(),
    cnpj: cnpj,
    corporateName: corporateName,
    email: email,
    phone: phone,
    tradeName: tradeName
  );

  Map toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt
  };
}
