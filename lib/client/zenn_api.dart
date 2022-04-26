import 'package:http/http.dart' as http;

import 'api_client.dart';

abstract class ZennAPIClient {
  Future<http.Response> list(String topicName);
}

class ZennAPI extends ApiClient implements ZennAPIClient {
  @override
  Future<http.Response> list(String topicName) async {
    const baseUrl = 'https://zenn.dev/api/articles';
    final params = <String, String>{
      'topicname': topicName.toString(),
      'order': 'daily',
      'count': '10',
      'page': '1'
    };
    return await get(baseUrl, params, false);
  }
}
