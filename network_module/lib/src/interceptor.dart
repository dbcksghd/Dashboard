import 'package:dio/dio.dart';
import 'package:network_module/src/dio_request_options.dart';

abstract class Interceptor {
  void onRequest(DioRequestOptions options);

  void onResponse(Response<dynamic> response);

  void onError(Object error);
}
