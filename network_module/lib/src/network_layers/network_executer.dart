import 'package:network_module/src/base_network_dto.dart';
import 'package:network_module/src/network_layers/network_creator.dart';
import 'package:network_module/src/network_layers/network_decoder.dart';
import 'package:network_module/src/request_options.dart';

class NetworkExecuter {
  Future<T> execute<T extends BaseResponseDTO>(
      {required DioRequestOptions options,
      required BaseResponseDTO responseType,
      JWTTokenType? jwtTokenType}) async {
    var response = await NetworkCreator.shared.request(
        jwtTokenType: jwtTokenType ?? JWTTokenType.none,
        requestOptions: options);
    var data = NetworkDecoder.decodeHelper.decode<T>(
      response: response,
      responseType: responseType,
    );
    return data;
  }
}
