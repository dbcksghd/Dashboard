import 'package:dio/dio.dart';
import 'package:network_module/src/base_network_dto.dart';

class NetworkDecoder {
  static var decodeHelper = NetworkDecoder();

  T decode<T extends BaseResponseDTO>(
      {required Response<dynamic> response,
      required BaseResponseDTO responseType}) {
    try {
      if (response.data is List) {
        var list = response.data as List;
        return List<T>.from(
            list.map((item) => responseType.fromJson(item)).toList()) as T;
      } else {
        return responseType.fromJson(response.data) as T;
      }
    } on TypeError {
      rethrow;
    }
  }
}
