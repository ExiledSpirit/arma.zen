import 'package:armazen/domain/entities/manufacturer_entity.dart';

import '../http/http.dart';
import './generic_model.dart';
import 'remote_address_model.dart';

class RemoteManufacturerModel extends GenericModel {
  final String tradeName;

  final String corporateName;

  final String cnpj;

  final RemoteAddressModel address;

  final String phone;

  final String email;

  RemoteManufacturerModel({required this.tradeName, required this.corporateName, required this.cnpj, required this.address, required this.phone, required this.email, required super.id, required super.createdAt, required super.updatedAt});

  factory RemoteManufacturerModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt', 'tradeName', 'corporateName', 'cnpj', 'address', 'phone', 'email'])) {
      throw HttpError.invalidData;
    }
    return RemoteManufacturerModel(
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

  ManufacturerEntity toEntity() => ManufacturerEntity(
    tradeName: tradeName,
    corporateName: corporateName,
    cnpj: cnpj,
    address: address.toEntity(),
    phone: phone,
    email: email,
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );
}
