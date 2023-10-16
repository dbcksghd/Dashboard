import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

enum TodoEndpoint with TestEndpoint {
  todos();

  @override
  String get domain => switch (this) { todos => "todos" };

  @override
  HTTPMethod get httpMethod => switch (this) { todos => HTTPMethod.get };

  @override
  Map<int, Error> get errorMap => switch (this) { todos => {404: Error()} };

  @override
  Map<String, dynamic> get body => {};

  @override
  Map<String, dynamic> get queryParam => {};
}
