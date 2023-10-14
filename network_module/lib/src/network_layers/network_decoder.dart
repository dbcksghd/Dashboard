import 'package:dio/dio.dart';
import 'package:network_module/src/base_network_dto.dart';

class NetworkDecoder {
  static var decodeHelper = NetworkDecoder();

  K decode<T extends BaseResponseDTO, K>(
      {required Response<dynamic> response, required T responseType}) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        return List<T>.from(
            list.map((item) => responseType.fromJson(item)).toList()) as K;
      } else {
        return responseType.fromJson(response.data) as K;
      }
    } on TypeError {
      rethrow;
    }
  }
}
