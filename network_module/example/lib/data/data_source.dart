import 'package:network_module/network_module.dart';
import 'package:network_module_example/data/response_dto.dart';
import 'package:network_module_example/domain/entity.dart';

class DataSource {
  final HttpHelper _httpHelper;

  DataSource({required HttpHelper httpHelper}) : _httpHelper = httpHelper;

  Future<Result<TestEntity, Exception>> getTest() async {
    final res = await _httpHelper.network<Test>(
        options: DioRequestOptions(
            baseUrl: "https://jsonplaceholder.typicode.com/todos/1",
            httpMethod: HTTPMethod.get),
        responseType: Test());
    switch (res) {
      case Success(value: final value):
        return Success(value: value.toEntity());
      case Failure(exception: final e):
        return Failure(exception: e);
    }
  }
}
