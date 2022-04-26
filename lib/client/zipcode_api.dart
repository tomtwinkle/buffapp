import 'package:http/http.dart' as http;

import 'api_client.dart';

abstract class ZipCodeAPIClient {
  Future<http.Response> getAddressFromZipCode(String zipCode);
}

class ZipCodeAPI extends ApiClient implements ZipCodeAPIClient {
  @override
  Future<http.Response> getAddressFromZipCode(String zipCode) async {
    const baseUrl = 'https://zipcloud.ibsnet.co.jp/api/search';
    final params = <String, String>{
      'zipcode': zipCode.toString(),
      'limit': '1'
    };
    return await get(baseUrl, params, false);
  }
}
