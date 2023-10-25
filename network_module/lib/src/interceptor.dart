import 'package:dio/dio.dart';
import 'package:network_module/network_module.dart';

abstract class Interceptor<T extends DioRequestOptions> {
  void onRequest(T options);

  void onResponse(Response<dynamic> response);

  void onError(Object error);
}
