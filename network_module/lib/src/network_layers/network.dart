import 'package:dio/dio.dart';
import 'package:network_module/src/dio_request_options.dart';

class Network {
  static final network = Network();
  final Dio _client = Dio();

  Future<Response> request({required DioRequestOptions requestOptions}) {
    return _client.fetch(RequestOptions(
      baseUrl: requestOptions.baseUrl,
      method: requestOptions.httpMethod.name,
      data: requestOptions.body,
      headers: requestOptions.headers,
      queryParameters: requestOptions.queryParam,
      sendTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
    ));
  }
}
