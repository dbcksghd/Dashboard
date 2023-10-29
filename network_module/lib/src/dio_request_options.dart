import 'package:network_module/network_module.dart';

abstract class DioRequestOptions {
  String get baseUrl;

  HTTPMethod get httpMethod;

  Map<String, dynamic>? get queryParam;

  BaseRequestDTO? get body;

  Map<String, String> headers = {};
}
