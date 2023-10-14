import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_rest_api_domain.dart';

mixin TestEndpoint implements DioRequestOptions {
  TestRestAPIDomain get domain;

  Map<int, Error> get errorMap;

  @override
  String get baseUrl => "https://jsonplaceholder.typicode.com/${domain.name}/1";

  Map<String, String> get headers => {'Content-Type': 'application/json'};
}