import '../../../../presentation/presenters/presenters.dart';
import '../../../../ui/pages/pages.dart';
import '../../factories.dart';

ManufacturersPresenter makeGetxManufacturerPresenter() => GetxManufacturersPresenter(
  addManufacturer: makeRemoteAddManufacturer(),
  validation: makeManufacturerValidation(),
);