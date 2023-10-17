import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/entity/auth/sign_in_entity.dart';
import 'package:network_module/network_module.dart';

abstract interface class AuthRepository {
  Future<Result<SignInEntity, Exception>> signIn(
      SignInRequestDTO signInRequestDTO);
}
