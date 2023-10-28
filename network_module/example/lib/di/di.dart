import 'package:network_module_example/core/networking/interface/interceptor/logging/logging.dart';
import 'package:network_module_example/core/networking/interface/networking.dart';
import 'package:network_module_example/core/networking/source/networking_impl.dart';
import 'package:network_module_example/data/remote/remote_data_source.dart';
import 'package:network_module_example/data/repository_impl.dart';
import 'package:network_module_example/domain/repository.dart';
import 'package:network_module_example/domain/use_case.dart';
import 'package:network_module_example/presentation/view_model.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> di() {
  Networking networking = NetworkingImpl()
    ..interceptor.add(LoggingInterceptor());
  RemoteDataSource dataSource = RemoteDataSource(networking: networking);
  Repository repository = RepositoryImpl(dataSource: dataSource);
  UseCase useCase = UseCase(repository: repository);
  return [
    ChangeNotifierProvider<ViewModel>(
        create: (context) => ViewModel(useCase: useCase)),
  ];
}
