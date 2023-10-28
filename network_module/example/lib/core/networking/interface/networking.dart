import 'package:network_module/network_module.dart';
import 'package:network_module_example/core/networking/interface/endpoint/test_endpoint.dart';

abstract class Networking {
  Future<Result<K, Exception>> request<T extends BaseResponseDTO, K>(
      {required TestEndpoint options,
        required T responseType});
}