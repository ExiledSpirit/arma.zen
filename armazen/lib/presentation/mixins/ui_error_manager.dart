import 'package:armazen/ui/helpers/errors/ui_error.dart';
import 'package:get/get.dart';

mixin UIErrorManager on GetxController {
  final _mainError = Rx<UIError?>(null);
  Stream<UIError?> get mainErrorStream => _mainError.stream;
  set mainError(UIError? value) => _mainError.value = value;
}