import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';

abstract class Repository {
  Future<Result<List<TestEntity>, Exception>> getTest();
}
