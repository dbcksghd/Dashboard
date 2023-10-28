import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_rest_api_domain.dart';

abstract class TestEndpoint extends DioRequestOptions {
  String get path;

  Map<int, Exception> get errorMap;

  @override
  String get baseUrl => "https://jsonplaceholder.typicode.com/${path}";

  @override
  Map<String, String> headers = {'Content-Type': 'application/json'};
}