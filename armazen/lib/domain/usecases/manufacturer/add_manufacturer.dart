import 'package:armazen/domain/entities/manufacturer_entity.dart';

abstract class AddManufacturer {
  Future<ManufacturerEntity> add(AddManufacturerParams params);
}

class AddManufacturerParams {
  final String tradeName;
  final String corporateName;
  final String cnpj;
  final String phone;
  final String email;

  const AddManufacturerParams({
    required this.tradeName,
    required this.corporateName,
    required this.cnpj,
    required this.phone,
    required this.email
  });
}