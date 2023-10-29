import 'package:network_module/network_module.dart';

abstract class Interceptor<T extends DioRequestOptions> {
  Future<void> onRequest(T endpoint);

  Future<void> onResponse(T endpoint, Response<dynamic> response);

  Future<void> onError(Object error);
}
