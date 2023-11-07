import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/repository/auth_repository.dart';
import 'package:network_module/network_module.dart';

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<Result<void, Exception>> execute(
          SignInRequestDTO signInRequestDTO) async =>
      await _authRepository.signIn(signInRequestDTO);
}
