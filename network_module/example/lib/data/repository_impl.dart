import 'package:network_module_example/data/data_source.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/repository.dart';

class RepositoryImpl implements Repository {
  final DataSource _dataSource;

  RepositoryImpl({required DataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<TestEntity> getTest() => _dataSource.getTest();
}
