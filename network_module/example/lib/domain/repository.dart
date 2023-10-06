import 'package:network_module_example/domain/entity.dart';

abstract class Repository {
  Future<TestEntity> getTest();
}
