import 'package:http/http.dart' as http;

class ApiClient {
  final _timeout = const Duration(seconds: 30);

  Future<http.Response> get(
    String url,
    Map<String, String?> params,
    bool withToken, {
    Map<String, List<dynamic>>? listParam,
    bool allowEmpty = false,
  }) async {
    try {
      final client = http.Client();
      var requestUrl = url;
      if (params.keys.isNotEmpty) {
        requestUrl = addParamToUrl(url, params, allowEmpty: allowEmpty);
        if (listParam != null) {
          requestUrl = _addListParamToUrl(
            requestUrl,
            listParam.keys.first.toString(),
            listParam.values.first,
          );
        }
      }

      print('request url: $requestUrl');
      final response = await client
          .get(
            Uri.parse(requestUrl),
          )
          .timeout(_timeout);
      print(
          'response: statusCode=${response.statusCode}, body=${response.body}');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(String url, body, bool withToken) async {
    try {
      final client = http.Client();
      final requestUrl = Uri.parse(url);
      print('request url: $requestUrl');
      final headers = await getHeaders();
      final response = await client
          .post(
            requestUrl,
            headers: headers,
            body: body,
          )
          .timeout(_timeout);

      print('request body: $body');
      print(
          'response: statusCode=${response.statusCode}, body=${response.body}');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> put(String url, body, bool withToken) async {
    try {
      final client = http.Client();
      final requestUrl = Uri.parse(url);
      print('request url: $requestUrl');
      final headers = await getHeaders();
      final response = await client
          .put(
            requestUrl,
            headers: headers,
            body: body,
          )
          .timeout(_timeout);

      print('request body: $body');
      print(
          'response: statusCode=${response.statusCode}, body=${response.body}');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> delete(
    String url,
    Map<String, String?> params,
    bool withToken, {
    Map<String, List<dynamic>>? listParam,
  }) async {
    try {
      final client = http.Client();
      var requestUrl = url;
      print('request url: $requestUrl');
      if (params.keys.isNotEmpty) {
        requestUrl = addParamToUrl(url, params);
        if (listParam != null) {
          requestUrl = _addListParamToUrl(
            requestUrl,
            listParam.keys.first.toString(),
            listParam.values.first,
          );
        }
      }

      final response = await client
          .delete(
            Uri.parse(requestUrl),
          )
          .timeout(_timeout);
      print(
          'response: statusCode=${response.statusCode}, body=${response.body}');

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> getHeaders() async {
    final headers = {
      'Content-type': 'application/json',
    };
    return headers;
  }

  static String _addListParamToUrl(
    String base,
    String title,
    List<dynamic> items,
  ) {
    var result = base;
    for (final item in items) {
      result += '&$title=$item';
    }
    print(result.toString());
    return result;
  }

  static String addParamToUrl(String base, Map<String, String?> params,
      {bool allowEmpty = false}) {
    var result = base;
    result += '?';
    params.forEach((key, value) {
      if (value != null && (value.isNotEmpty || allowEmpty)) {
        result += '$key=$value&';
      }
    });
    final res = result.substring(0, result.length - 1);
    return res;
  }
}
