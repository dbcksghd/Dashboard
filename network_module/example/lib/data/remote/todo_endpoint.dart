import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

sealed class TodoEndpoint extends TestEndpoint {
  TodoEndpoint();

  factory TodoEndpoint.nestedStructuresWithLists() = NestedStructuresWithLists;

  @override
  BaseRequestDTO? get body => switch (this) {
        NestedStructuresWithLists() => null,
      };

  @override
  String get path => switch (this) {
        NestedStructuresWithLists() => "jlgalarza3/1.2-pet-project/db",
      };

  @override
  Map<int, Exception> get errorMap => {};

  @override
  HTTPMethod get httpMethod => switch (this) {
        NestedStructuresWithLists() => HTTPMethod.get,
      };

  @override
  Map<String, dynamic>? get queryParam => {};
}

final class NestedStructuresWithLists extends TodoEndpoint {}
