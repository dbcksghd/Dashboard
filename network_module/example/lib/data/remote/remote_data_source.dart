import 'package:network_module/network_module.dart';
import 'package:network_module_example/data/response_dto.dart';
import 'package:network_module_example/domain/entity.dart';

class RemoteDataSource {
  final HttpHelper _httpHelper;

  RemoteDataSource({required HttpHelper httpHelper}) : _httpHelper = httpHelper;

  Future<Result<TestEntity, Exception>> getTest() async {
    final res = await _httpHelper.network<Test>(
        options: DioRequestOptions(
            baseUrl: "https://jsonplaceholder.typicode.com/todos/1",
            httpMethod: HTTPMethod.get),
        responseType: Test());
    return switch (res) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
