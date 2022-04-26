import 'dart:async';
import 'dart:convert';

import '../client/zenn_api.dart';
import '../model/address.dart';

abstract class ZennRepositoryInterface {
  Future<Address> listTopics(String topicName);
}

class ZennRepository implements ZennRepositoryInterface {
  final ZennAPIClient _client;

  ZennRepository({
    required ZennAPIClient client,
  }) : _client = client;

  @override
  Future<Address> listTopics(String topicName) async {
    try {
      final response = await _client.list(topicName);
      final jsonResponse = json.decode(response.body);
      final jsonData = jsonResponse['articles'] as Map<String, dynamic>;
      return Address.fromJson(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}
