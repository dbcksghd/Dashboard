import 'package:client/data/data_source/auth/local/auth_local_data_source.dart';
import 'package:client/data/data_source/auth/remote/auth_remote_data_source.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:client/domain/repository/auth_repository.dart';
import 'package:network_module/network_module.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(
      {required AuthLocalDataSource authLocalDataSource,
      required AuthRemoteDataSource authRemoteDataSource})
      : _authLocalDataSource = authLocalDataSource,
        _authRemoteDataSource = authRemoteDataSource;

  @override
  Future<Result<void, Exception>> signIn(
          SignInRequestDTO signInRequestDTO) async =>
      await _authRemoteDataSource.signIn(signInRequestDTO);

  @override
  Future<JwtTokenEntity> getToken() async => _authLocalDataSource.getToken();
}
