import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:network_module/src/request_options.dart';

enum JWTTokenType { accessToken, refreshToken, none }

class NetworkCreator {
  final Dio _client = Dio();
  final JWTTokenType _jwtTokenType;
  final DioRequestOptions _requestOptions;
  final JwtStore _jwtStore = JwtStore();

  NetworkCreator(
      {required JWTTokenType jwtTokenType,
      required DioRequestOptions requestOptions})
      : _jwtTokenType = jwtTokenType,
        _requestOptions = requestOptions;

  Future<Response> request() {
    switch (_jwtTokenType) {
      case JWTTokenType.accessToken:
      case JWTTokenType.refreshToken:
        _client.options.headers['Authorization'] =
            'Bearer ${_jwtStore.load(properties: JwtStoreProperties.accessToken)}';
        break;
      case JWTTokenType.none:
        break;
    }
    return _client.fetch(RequestOptions(
      baseUrl: "https://naver.com",
      path: _requestOptions.path,
      method: _requestOptions.httpMethod.name,
      data: jsonEncode(_requestOptions.body),
      headers: _requestOptions.headers,
      queryParameters: _requestOptions.queryParam,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }
}
