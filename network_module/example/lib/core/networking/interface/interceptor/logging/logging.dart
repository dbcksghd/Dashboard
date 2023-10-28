import 'package:network_module/network_module.dart';

class LoggingInterceptor extends Interceptor {

  @override
  Future<void> onRequest(DioRequestOptions options) async {
    print(options.baseUrl);
  }

  @override
  Future<void> onResponse(Response<dynamic> response) async {
    print(response.data);
  }

  @override
  Future<void> onError(Object error) async {}

}