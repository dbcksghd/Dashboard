import 'package:network_module/src/http_method.dart';

class DioRequestOptions {
  String baseUrl;
  HTTPMethod httpMethod;
  Map<String, dynamic>? queryParam, body;
  Map<String, String>? headers;

  DioRequestOptions(
      {required this.baseUrl,
      required this.httpMethod,
      this.body,
      this.queryParam,
      this.headers});
}
