import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

sealed class TodoEndpoint extends TestEndpoint {
  TodoEndpoint();

  factory TodoEndpoint.todos({required int id}) = Todos;

  @override
  Map<String, dynamic>? get body => {};

  @override
  String get domain => switch (this) { Todos(id: final id) => "todos/$id" };

  @override
  Map<int, Exception> get errorMap => {};

  @override
  HTTPMethod get httpMethod => switch (this) { Todos() => HTTPMethod.get };

  @override
  Map<String, dynamic>? get queryParam => {};
}

final class Todos extends TodoEndpoint {
  int id;

  Todos({required this.id});
}
