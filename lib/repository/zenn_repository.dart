import 'dart:async';
import 'dart:convert';

import '../client/zenn_api.dart';
import '../model/zenn_topic.dart';

abstract class ZennRepositoryInterface {
  Future<ZennTopic> listTopics(String topicName);
}

class ZennRepository implements ZennRepositoryInterface {
  final ZennAPIClient _client;

  ZennRepository({
    required ZennAPIClient client,
  }) : _client = client;

  @override
  Future<ZennTopic> listTopics(String topicName) async {
    try {
      final response = await _client.list(topicName);
      final jsonResponse = json.decode(response.body);
      final jsonData = jsonResponse as Map<String, dynamic>;
      return ZennTopic.fromJson(jsonData);
    } catch (e) {
      rethrow;
    }
  }
}
