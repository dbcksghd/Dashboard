import 'package:dio/dio.dart';
import 'package:network_module/src/dio_request_options.dart';

class Network {
  static final network = Network();
  final Dio _client = Dio();

  Future<Response> request({required DioRequestOptions options}) {
    return _client.fetch(RequestOptions(
      baseUrl: options.baseUrl,
      method: options.httpMethod.name,
      data: options.body,
      headers: options.headers,
      queryParameters: options.queryParam,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }
}
