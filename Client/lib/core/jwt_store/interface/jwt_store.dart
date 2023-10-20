import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';

abstract interface class JwtStore {
  Future<void> save(
      {required JwtStoreProperties properties, required String token});

  Future<String> load({required JwtStoreProperties properties});

  Future<void> delete(JwtStoreProperties properties);
}
