import 'package:network_module/network_module.dart';

abstract class Interceptor<T extends DioRequestOptions> {
  Future<void> onRequest(T options);

  Future<void> onResponse(Response<dynamic> response);

  Future<void> onError(Object error);
}
