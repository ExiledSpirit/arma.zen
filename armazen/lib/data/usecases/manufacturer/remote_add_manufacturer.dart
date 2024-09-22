import 'package:armazen/data/models/remote_manufacturer_model.dart';
import 'package:armazen/domain/entities/manufacturer_entity.dart';
import 'package:armazen/domain/usecases/manufacturer/add_manufacturer.dart';

import '../../../domain/helpers/helpers.dart';
import '../../http/http.dart';

class RemoteAddManufacturer implements AddManufacturer {
  final HttpClient httpClient;
  final String url;

  RemoteAddManufacturer({
    required this.httpClient,
    required this.url
  });

  @override
  Future<ManufacturerEntity> add(AddManufacturerParams params) async {
    final body = RemoteAddManufacturerParams.fromDomain(params).toJson();
    try {
      final httpResponse = await httpClient.request(url: url, method: 'post', body: body);
      return RemoteManufacturerModel.fromJson(json: httpResponse).toEntity();
    } on HttpError catch(error) {
      throw DomainError.unexpected;
    }
  }
}

class RemoteAddManufacturerParams {
  final String tradeName;
  final String corporateName;
  final String cnpj;
  final String phone;
  final String email;

  RemoteAddManufacturerParams({
    required this.tradeName,
    required this.corporateName,
    required this.cnpj,
    required this.phone,
    required this.email
  });

  factory RemoteAddManufacturerParams.fromDomain(AddManufacturerParams params) => RemoteAddManufacturerParams(
    corporateName: params.corporateName,
    tradeName: params.tradeName,
    cnpj: params.cnpj,
    phone: params.phone,
    email: params.email
  );

  Map toJson() => {
    'corporateName': corporateName,
    'tradeName': tradeName,
    'cnpj': cnpj,
    'phone': phone,
    'email': email,
  };
}