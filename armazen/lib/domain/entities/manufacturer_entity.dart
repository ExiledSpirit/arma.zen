import 'generic_entity.dart';
import 'address_entity.dart';

class ManufacturerEntity extends GenericEntity {
  final String tradeName;

  final String corporateName;

  final String cnpj;

  final AddressEntity address;

  final String phone;

  final String email;
  
  @override
  List get props => [id, createdAt, updatedAt, tradeName, corporateName, cnpj, address, phone, email];

  const ManufacturerEntity({required this.tradeName, required this.corporateName, required this.cnpj, required this.address, required this.phone, required this.email, required super.id, required super.createdAt, required super.updatedAt});
}
