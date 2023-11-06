import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';

class AuthLocalDataSource {
  final JwtStore _jwtStore;

  AuthLocalDataSource({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  Future<JwtTokenEntity> getToken() async {
    return JwtTokenEntity(
        accessToken:
            await _jwtStore.load(properties: JwtStoreProperties.accessToken),
        refreshToken:
            await _jwtStore.load(properties: JwtStoreProperties.refreshToken),
        accessTokenExpireAt: await _jwtStore.load(
            properties: JwtStoreProperties.accessTokenExpireAt),
        refreshTokenExpireAt: await _jwtStore.load(
            properties: JwtStoreProperties.refreshTokenExpireAt));
  }
}
