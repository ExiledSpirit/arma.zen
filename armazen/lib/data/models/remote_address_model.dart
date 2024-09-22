import 'package:armazen/domain/entities/address_entity.dart';

import '../http/http.dart';
import 'generic_model.dart';

class RemoteAddressModel extends GenericModel {
  RemoteAddressModel({required super.id, required super.createdAt, required super.updatedAt});
  
  factory RemoteAddressModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt'])) {
      throw HttpError.invalidData;
    }
    return RemoteAddressModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  AddressEntity toEntity() => AddressEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );
}