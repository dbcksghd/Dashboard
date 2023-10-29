import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/network.dart';
import 'package:network_module/network_module.dart';

class NetworkingImpl implements Networking {
  List<Interceptor> interceptor = List.empty(growable: true);

  @override
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required DashboardEndpoint endpoint, required T responseType}) async {
    try {
      for (var e in interceptor) {
        await e.onRequest(endpoint);
      }
      final response = await Network.network.request(options: endpoint);
      for (var e in interceptor) {
        await e.onResponse(endpoint, response);
      }
      final decodeData = NetworkDecoder.decodeHelper.decode<T, K>(
        response: response,
        responseType: responseType,
      );
      return Success(value: decodeData);
    } catch (error) {
      for (var e in interceptor) {
        await e.onError(error);
      }
      return Failure(exception: Exception(error));
    }
  }

  @override
  Future<Result<void, Exception>> noResponseRequest(
      {required DashboardEndpoint endpoint}) async {
    try {
      for (var e in interceptor) {
        await e.onRequest(endpoint);
      }
      final response = await Network.network.request(options: endpoint);
      for (var e in interceptor) {
        await e.onResponse(endpoint, response);
      }
      return const Success(value: null);
    } catch (error) {
      for (var e in interceptor) {
        await e.onError(error);
      }
      return Failure(exception: Exception(error));
    }
  }
}
