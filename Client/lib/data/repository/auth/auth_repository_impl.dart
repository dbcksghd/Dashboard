import 'package:client/data/data_source/auth/remote/auth_remote_data_source.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:client/domain/repository/auth_repository.dart';
import 'package:network_module/network_module.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<Result<JwtTokenEntity, Exception>> signIn(
          SignInRequestDTO signInRequestDTO) async =>
      await _remoteDataSource.signIn(signInRequestDTO);
}
