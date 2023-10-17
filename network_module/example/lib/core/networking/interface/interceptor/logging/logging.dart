import 'package:network_module/network_module.dart';

class LoggingInterceptor extends Interceptor {

  @override
  void onRequest(DioRequestOptions options) {
    print(options.baseUrl);
  }

  @override
  void onResponse(Response<dynamic> response) {
    print(response.data);
  }

  @override
  void onError(Object error) {
    // TODO: implement onError
  }

}