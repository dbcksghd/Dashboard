import 'package:network_module/network_module.dart';
import 'package:network_module_example/data/response_dto.dart';
import 'package:network_module_example/domain/entity.dart';

class DataSource {
  final HttpHelper _httpHelper;

  DataSource({required HttpHelper httpHelper}) : _httpHelper = httpHelper;

  Future<TestEntity> getTest() async {
    final res = await _httpHelper.execute<Test>(
        options:
            DioRequestOptions(path: "/todos/1", httpMethod: HTTPMethod.get),
        responseType: Test());
    return res.toEntity();
  }
}
