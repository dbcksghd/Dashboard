import 'package:network_module/src/base_network_dto.dart';
import 'package:network_module/src/network_layers/network_creator.dart';
import 'package:network_module/src/network_layers/network_decoder.dart';
import 'package:network_module/src/request_options.dart';

class HttpHelper {
  String baseUrl;

  HttpHelper({required this.baseUrl});

  Future<T> execute<T extends BaseResponseDTO>(
      {required DioRequestOptions options,
      required BaseResponseDTO responseType,
      JWTTokenType? jwtTokenType}) async {
    final response = await Network.network.request(
        baseUrl: baseUrl,
        jwtTokenType: jwtTokenType ?? JWTTokenType.none,
        requestOptions: options);
    return NetworkDecoder.decodeHelper.decode<T>(
      response: response,
      responseType: responseType,
    );
  }
}
