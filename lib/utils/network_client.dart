import 'dart:convert';

import 'package:chargemod_assign/utils/api.dart';
import 'package:dio/dio.dart';

enum RequestType {
  GET,
  POST,
}

class NetworkClient {
  static const baseUrl = ApiEndPoints.baseUrl;
  static final Dio _client = Dio();

  Future<Response> request(
    RequestType type,
    String path, {
    Map<String, String> queries = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    // var headers = {
    //   'Content-Type': 'application/json',
    //   'Authorization':'Bearer '
    // };
    switch (type) {
      case RequestType.GET:
        return _client.get('$baseUrl$path',
            queryParameters: queries,
            options: Options(headers: headers, method: 'GET'));
      case RequestType.POST:
        return _client.post('$baseUrl$path',
            data: json.encode(body),
            options: Options(headers: headers, method: 'POST'));
      default:
        return throw Exception("The HTTP request method is not found");
    }
  }
}
