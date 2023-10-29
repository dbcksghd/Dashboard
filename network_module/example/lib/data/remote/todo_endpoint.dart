import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

sealed class TodoEndpoint extends TestEndpoint {
  TodoEndpoint();

  factory TodoEndpoint.todos({required int id}) = Todos;

  @override
  BaseRequestDTO? get body => switch (this) { Todos() => null };

  @override
  String get path => switch (this) { Todos(id: final id) => "todos/$id" };

  @override
  Map<int, Exception> get errorMap => {};

  @override
  HTTPMethod get httpMethod => switch (this) { Todos() => HTTPMethod.get };

  @override
  Map<String, String>? get queryParam => {};
}

final class Todos extends TodoEndpoint {
  int id;

  Todos({required this.id});
}
