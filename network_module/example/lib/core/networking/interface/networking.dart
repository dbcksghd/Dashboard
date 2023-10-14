import 'package:network_module/network_module.dart';


abstract class Networking {
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required DioRequestOptions options,
        required T responseType});
}