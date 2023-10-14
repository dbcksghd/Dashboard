import 'package:network_module_example/core/networking/interface/networking.dart';
import 'package:network_module/network_module.dart';
class NetworkingImpl implements Networking {
  final HttpHelper _httpHelper;

  NetworkingImpl({required HttpHelper httpHelper}) : _httpHelper = httpHelper;

  @override
  Future<Result<T, Exception>> request<T extends BaseResponseDTO>(
      {required DioRequestOptions options,
        required BaseResponseDTO responseType}) async =>
      await _httpHelper.network<T>(
          options: options, responseType: responseType);
}