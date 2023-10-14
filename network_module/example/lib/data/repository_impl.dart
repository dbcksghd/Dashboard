import 'package:network_module/network_module.dart';
import 'package:network_module_example/data/remote/remote_data_source.dart';
import 'package:network_module_example/domain/entity.dart';
import 'package:network_module_example/domain/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _dataSource;

  RepositoryImpl({required RemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<Result<List<TestEntity>, Exception>> getTest() async =>
      _dataSource.getTest();
}
