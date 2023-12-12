import 'package:network_module_example/core/networking/interface/networking.dart';
import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

class NetworkingImpl implements Networking {

  List<Interceptor> interceptor = List.empty(growable: true);

  @override
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required TestEndpoint options,
        required T responseType}) async {
    try {
      for (var e in interceptor) {
        await e.onRequest(options);
      }
      final response = await Network.network.request(options: options);
      for (var e in interceptor) {
        await e.onResponse(options, response);
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
}