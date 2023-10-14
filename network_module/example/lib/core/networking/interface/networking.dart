import 'package:network_module/network_module.dart';


abstract class Networking {
  Future<Result<T, Exception>> request<T extends BaseResponseDTO>(
      {required DioRequestOptions options,
        required BaseResponseDTO responseType});
}