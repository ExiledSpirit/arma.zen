import 'package:equatable/equatable.dart';

class ManufacturerViewModel extends Equatable {
  final String id;
  final String question;
  final String date;
  final bool didAnswer;

  List get props => [id, question, date, didAnswer];

  ManufacturerViewModel({
    required this.id,
    required this.question,
    required this.date,
    required this.didAnswer
  });
}