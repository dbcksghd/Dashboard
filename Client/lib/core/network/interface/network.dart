import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:network_module/network_module.dart';

abstract class Networking {
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required DashboardEndpoint endpoint, required T responseType});

  Future<Result<void, Exception>> noResponseRequest(
      {required DashboardEndpoint endpoint});
}
