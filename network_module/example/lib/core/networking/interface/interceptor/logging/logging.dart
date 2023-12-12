import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

class LoggingInterceptor extends Interceptor<TestEndpoint> {

  @override
  Future<void> onRequest(TestEndpoint endpoint) async {
    //print(endpoint.baseUrl);
  }

  @override
  Future<void> onResponse(TestEndpoint endpoint,
      Response<dynamic> response) async {
    //print(response.data);
  }

  @override
  Future<void> onError(Object error) async {}

}