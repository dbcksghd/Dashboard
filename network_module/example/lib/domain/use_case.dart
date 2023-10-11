import 'package:network_module/network_module.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/repository.dart';

class UseCase {
  final Repository _repository;

  UseCase({required Repository repository}) : _repository = repository;

  Future<Result<TestEntity, Exception>> execute() async =>
      _repository.getTest();
}
