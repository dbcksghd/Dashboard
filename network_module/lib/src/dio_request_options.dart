import 'package:network_module/src/base_network_dto.dart';
import 'package:network_module/src/http_method.dart';

abstract class DioRequestOptions {
  String get baseUrl;

  HTTPMethod get httpMethod;

  Map<String, String>? get queryParam;

  BaseRequestDTO? get body;

  Map<String, String> headers = {};
}
