import 'package:network_module/network_module.dart';

abstract class Interceptor<T extends DioRequestOptions> {
  Future<void> onRequest(T endpoint) async {}

  Future<void> onResponse(T endpoint, Response<dynamic> response) async {}

  Future<void> onError(Object error) async {}

}
