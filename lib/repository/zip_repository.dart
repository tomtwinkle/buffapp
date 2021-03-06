import 'dart:async';
import 'dart:convert';

import '../client/zipcode_api.dart';
import '../model/address.dart';

abstract class ZipRepositoryInterface {
  Future<Address> getAddressFromZipCode(String zipCode);
}

class ZipRepository implements ZipRepositoryInterface {
  final ZipCodeAPIClient _client;

  ZipRepository({
    required ZipCodeAPIClient client,
  }) : _client = client;

  @override
  Future<Address> getAddressFromZipCode(String zipCode) async {
    try {
      final response = await _client.getAddressFromZipCode(zipCode);
      final jsonResponse = json.decode(response.body);
      final jsonData = jsonResponse['results'][0] as Map<String, dynamic>;
      return Address.fromJson(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}
