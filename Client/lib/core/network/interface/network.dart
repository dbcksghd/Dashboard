import 'package:client/core/network/interface/endpoint/dashboard_request_options.dart';
import 'package:network_module/network_module.dart';

abstract class Networking {
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required DashboardRequestOptions options, required T responseType});
}
