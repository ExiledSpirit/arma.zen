import 'package:armazen/domain/entities/address_entity.dart';

import '../http/http.dart';
import 'generic_model.dart';

class LocalAddressModel extends GenericModel {
  LocalAddressModel({required super.id, required super.createdAt, required super.updatedAt});
  
  factory LocalAddressModel.fromJson({required Map<String, dynamic> json}) {
    if (!json.keys.toSet().containsAll(['id', 'createdAt', 'updatedAt'])) {
      throw HttpError.invalidData;
    }

    return LocalAddressModel(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt']
    );
  }

  factory LocalAddressModel.fromEntity(AddressEntity entity) => LocalAddressModel(
    id: entity.id,
    createdAt: entity.createdAt,
    updatedAt: entity.updatedAt
  );

  AddressEntity toEntity() => AddressEntity(
    id: id,
    createdAt: createdAt,
    updatedAt: updatedAt
  );

  Map toJson() => {
    'id': id,
    'createdAt': createdAt,
    'updatedAt': updatedAt
  };
}