import 'generic_entity.dart';

class AddressEntity extends GenericEntity {
  @override
  List get props => [id, createdAt, updatedAt];

  const AddressEntity({required super.id, required super.createdAt, required super.updatedAt});
}