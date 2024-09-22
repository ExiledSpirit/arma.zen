import 'package:equatable/equatable.dart';

abstract class GenericEntity extends Equatable {
  final int id;

  final DateTime createdAt;

  final DateTime updatedAt;

  @override
  List get props => [id, createdAt, updatedAt];

  const GenericEntity({required this.id, required this.createdAt, required this.updatedAt});
}
