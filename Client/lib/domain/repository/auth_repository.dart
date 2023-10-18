import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:network_module/network_module.dart';

abstract interface class AuthRepository {
  Future<Result<JwtTokenEntity, Exception>> signIn(
      SignInRequestDTO signInRequestDTO);
}
