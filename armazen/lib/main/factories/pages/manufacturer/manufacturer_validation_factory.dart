import '../../../../presentation/protocols/protocols.dart';
import '../../../../validation/protocols/protocols.dart';
import '../../../builders/builders.dart';
import '../../../composites/composites.dart';

Validation makeManufacturerValidation() => ValidationComposite(makeManufacturerValidations());

List<FieldValidation> makeManufacturerValidations() => [
  ...ValidationBuilder.field('corporateName').required().min(3).build(),
  ...ValidationBuilder.field('tradeName').required().min(3).build(),
  ...ValidationBuilder.field('cnpj').required().min(3).build(),
  ...ValidationBuilder.field('phone').required().build(),
  ...ValidationBuilder.field('email').required().email().build()
];