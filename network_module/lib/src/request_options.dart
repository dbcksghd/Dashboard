import 'package:network_module/src/http_method.dart';

class DioRequestOptions {
  String? path;
  HTTPMethod httpMethod;
  void Function(int, int)? onReceiveProgress;
  Map<String, dynamic>? queryParam, headers, body;

  DioRequestOptions(
      {required this.httpMethod,
      this.path,
      this.body,
      this.onReceiveProgress,
      this.queryParam,
      this.headers});
}
