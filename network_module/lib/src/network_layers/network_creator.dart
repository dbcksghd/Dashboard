import 'package:dio/dio.dart';
import 'package:jwt_store/jwt_store.dart';
import 'package:network_module/src/request_options.dart';

enum JWTTokenType { accessToken, refreshToken, none }

class NetworkCreator {
  static var shared = NetworkCreator();
  final Dio _client = Dio();
  final JwtStore _jwtStore = JwtStore();

  Future<Response> request(
      {required JWTTokenType jwtTokenType,
      required DioRequestOptions requestOptions}) {
    switch (jwtTokenType) {
      case JWTTokenType.accessToken:
      case JWTTokenType.refreshToken:
        _client.options.headers['Authorization'] =
            'Bearer ${_jwtStore.load(properties: JwtStoreProperties.accessToken)}';
      case JWTTokenType.none:
    }
    return _client.fetch(RequestOptions(
      baseUrl: requestOptions.path,
      method: requestOptions.httpMethod.name,
      data: requestOptions.body,
      headers: requestOptions.headers,
      queryParameters: requestOptions.queryParam,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }
}
