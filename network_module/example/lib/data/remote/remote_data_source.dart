import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/networking.dart';
import 'package:network_module_example/data/remote/todo_endpoint.dart';
import 'package:network_module_example/data/response_dto.dart';
import 'package:network_module_example/domain/entity.dart';

class RemoteDataSource {
  final Networking networking;

  RemoteDataSource({required this.networking});

  Future<Result<List<TestEntity>, Exception>> getTest() async {
    final res = await networking.request<TestList, List<Test>>(
        options: TodoEndpoint.nestedStructuresWithLists(),
        responseType: TestList());
    return switch (res) {
      Success(value: final value) =>
        Success(value: value.map((e) => e.toEntity()).toList()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
