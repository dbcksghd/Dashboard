import 'package:network_module/src/http_method.dart';

abstract class DioRequestOptions {
  String get baseUrl;

  HTTPMethod get httpMethod;

  Map<String, dynamic>? get queryParam;

  Map<String, dynamic>? get body;

  Map<String, String>? get headers;
}
