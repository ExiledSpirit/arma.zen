import 'package:armazen/data/usecases/manufacturer/add_manufacturer.dart';
import 'package:armazen/domain/usecases/manufacturer/add_manufacturer.dart';

import '../factories.dart';

AddManufacturer makeRemoteAddManufacturer() => RemoteAddManufacturer(
  httpClient: makeHttpAdapter(),
  url: makeApiUrl('manufacturer')
);
