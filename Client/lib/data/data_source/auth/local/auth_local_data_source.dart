import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';

class AuthLocalDataSource {
  final JwtStore _jwtStore;

  AuthLocalDataSource({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  Future<String> getToken({required JwtStoreProperties properties}) async {
    return await _jwtStore.load(properties: properties) ?? "";
  }

  Future<void> saveToken(
      {required JwtStoreProperties properties, required String token}) async {
    await _jwtStore.save(properties: properties, token: token);
  }

  Future<void> deleteToken({required JwtStoreProperties properties}) async {
    await _jwtStore.delete(properties);
  }
}
