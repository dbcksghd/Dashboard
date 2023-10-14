import 'package:network_module/src/base_network_dto.dart';
import 'package:network_module/src/dio_request_options.dart';
import 'package:network_module/src/interceptor.dart';
import 'package:network_module/src/network_layers/network.dart';
import 'package:network_module/src/network_layers/network_decoder.dart';
import 'package:network_module/src/result.dart';

class HttpHelper {
  List<Interceptor> interceptor = List.empty(growable: true);

  Future<Result<K, Exception>> network<T extends BaseResponseDTO, K>(
      {required DioRequestOptions options, required T responseType}) async {
    try {
      for (var e in interceptor) {
        e.onRequest(options);
      }
      final response = await Network.network.request(options: options);
      for (var e in interceptor) {
        e.onResponse(response);
      }
      final decodeData = NetworkDecoder.decodeHelper.decode<T, K>(
        response: response,
        responseType: responseType,
      );
      return Success(value: decodeData);
    } catch (error) {
      for (var e in interceptor) {
        e.onError(error);
      }
      return Failure(exception: Exception(error));
    }
  }
}
