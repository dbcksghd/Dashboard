import 'package:network_module_example/core/networking/interface/networking.dart';
import 'package:network_module/network_module.dart';

class NetworkingImpl implements Networking {
  final HttpHelper _httpHelper;

  NetworkingImpl({required HttpHelper httpHelper}) : _httpHelper = httpHelper;

  @override
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required DioRequestOptions options,
        required T responseType}) async =>
      await _httpHelper.network<T, K>(
          options: options, responseType: responseType);
}