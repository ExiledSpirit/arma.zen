import 'package:armazen/domain/usecases/manufacturer/add_manufacturer.dart';

import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../../domain/helpers/helpers.dart';
import '../protocols/protocols.dart';
import '../mixins/mixins.dart';

import 'package:get/get.dart';

class GetxManufacturerPresenter extends GetxController with LoadingManager, NavigationManager, FormManager, UIErrorManager implements ManufacturersPresenter {
  final Validation validation;
  final AddManufacturer addManufacturerAddManufacturer;
  
  final _emailError = Rx<UIError?>(null);
  final _tradeNameError = Rx<UIError?>(null);
  final _cnpjError = Rx<UIError?>(null);
  final _corporateNameError = Rx<UIError?>(null);
  final _phoneError = Rx<UIError?>(null);
  
  String? _tradeName;
  String? _email;
  String? _cnpj;
  String? _corporateName;
  String? _phone;

  Stream<UIError?> get emailErrorStream => _emailError.stream;
  Stream<UIError?> get phoneErrorStream => _phoneError.stream;
  Stream<UIError?> get tradeNameErrorStream => _tradeNameError.stream;
  Stream<UIError?> get cnpjErrorStream => _cnpjError.stream;
  Stream<UIError?> get corporateNameErrorStream => _corporateNameError.stream;

  GetxManufacturerPresenter({
    required this.validation,
    required this.addManufacturerAddManufacturer
  });

  void validateEmail(String email) {
    _email = email;
    _emailError.value = _validateField('email');
    _validateForm();
  }

  void validateTradeName(String tradeName) {
    _tradeName = tradeName;
    _tradeNameError.value = _validateField('tradeName');
    _validateForm();
  }

  void validateCnpj(String cnpj) {
    _cnpj = cnpj;
    _cnpjError.value = _validateField('cnpj');
    _validateForm();
  }

  void validateCorporateName(String corporateName) {
    _corporateName = corporateName;
    _corporateNameError.value = _validateField('corporateName');
    _validateForm();
  }
  
  void validatePhone(String phone) {
    _corporateName = phone;
    _corporateNameError.value = _validateField('phone');
    _validateForm();
  }

  UIError? _validateField(String field) {
    final formData = {
      'tradeName': _tradeName,
      'phone': _phone,
      'email': _email,
      'cnpj': _cnpj,
      'corporateName': _corporateName
    };
    final error = validation.validate(field: field, input: formData);
    switch (error) {
      case ValidationError.invalidField: return UIError.invalidField;
      case ValidationError.requiredField: return UIError.requiredField;
      default: return null;
    }
  }

  void _validateForm() {
    isFormValid = _emailError.value == null
      && _tradeNameError.value == null
      && _cnpjError.value == null
      && _corporateNameError.value == null
      && _phoneError.value == null
      && _tradeName != null
      && _email != null
      && _cnpj != null
      && _corporateName != null
      && _phone != null;
  }

  Future<void> Manufacturer() async {
    try {
      mainError = null;
      isLoading = true;
      await addManufacturerAddManufacturer.add(AddManufacturerParams(
        tradeName: _tradeName!,
        email: _email!,
        cnpj: _cnpj!,
        corporateName: _corporateName!,
        phone: _phone!
      ));

      navigateTo = '/manufacturers';
    } on DomainError catch (error) {
      switch (error) {
        case DomainError.emailInUse: mainError = UIError.emailInUse; break;
        default: mainError = UIError.unexpected; break;
      }
      isLoading = false;
    }
  }

  void goToLogin() {
    navigateTo = '/login';
  }
  
  @override
  // TODO: implement ManufacturersStream
  Stream<List<ManufacturerViewModel>> get ManufacturersStream => throw UnimplementedError();
  
  @override
  void goToManufacturerResult(String manufacturerId) {
    // TODO: implement goToManufacturerResult
  }
  
  @override
  // TODO: implement isSessionExpiredStream
  Stream<bool> get isSessionExpiredStream => throw UnimplementedError();
  
  @override
  Future<void> loadData() {
    // TODO: implement loadData
    throw UnimplementedError();
  }
}