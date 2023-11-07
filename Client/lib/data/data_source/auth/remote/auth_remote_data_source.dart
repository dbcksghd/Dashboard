import 'package:client/core/network/interface/network.dart';
import 'package:client/data/data_source/auth/remote/auth_endpoint.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:network_module/network_module.dart';

class AuthRemoteDataSource {
  final Networking _networking;

  AuthRemoteDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> signIn(
          SignInRequestDTO signInRequestDTO) async =>
      await _networking.noResponseRequest(
          endpoint: AuthEndpoint.signIn(signInRequestDTO: signInRequestDTO));
}
