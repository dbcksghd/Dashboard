import 'package:network_module/src/http_method.dart';

class DioRequestOptions {
  String? path;
  HTTPMethod httpMethod;
  Map<String, dynamic>? queryParam, body;
  Map<String, String>? headers;

  DioRequestOptions(
      {required this.httpMethod,
      this.path,
      this.body,
      this.queryParam,
      this.headers});
}
