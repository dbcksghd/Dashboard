import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_rest_api_domain.dart';

enum TodoEndpoint with TestEndpoint {
  todos();

  final BaseRequestDTO? baseRequestDTO;

  const TodoEndpoint({this.baseRequestDTO});

  @override
  TestRestAPIDomain get domain => TestRestAPIDomain.todos;

  @override
  HTTPMethod get httpMethod => switch (this) { todos => HTTPMethod.get };

  @override
  Map<int, Error> get errorMap => switch (this) { todos => {404: Error()} };

  @override
  Map<String, String> get headers =>
      switch (this) { todos => {'Content-Type': 'application/json'} };

  @override
  Map<String, dynamic> get body => {};

  @override
  Map<String, dynamic> get queryParam => {};
}
