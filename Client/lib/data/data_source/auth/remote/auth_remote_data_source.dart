import 'package:client/core/network/interface/network.dart';
import 'package:client/data/data_source/auth/remote/auth_endpoint.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/data/dto/response/auth/sign_in_response_dto.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:network_module/network_module.dart';

class AuthRemoteDataSource {
  final Networking _networking;

  AuthRemoteDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<JwtTokenEntity, Exception>> signIn(
      SignInRequestDTO signInRequestDTO) async {
    final response =
        await _networking.request<SignInResponseDTO, SignInResponseDTO>(
            endpoint: AuthEndpoint.signIn(signInRequestDTO: signInRequestDTO),
            responseType: SignInResponseDTO());
    return switch (response) {
      Success(value: final value) => Success(value: value.toEntity()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
