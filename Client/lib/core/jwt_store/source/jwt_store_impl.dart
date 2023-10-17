import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStoreImpl {
  final FlutterSecureStorage _storage;

  JwtStoreImpl({required FlutterSecureStorage storage}) : _storage = storage;

  Future<void> save(
          {required JwtStoreProperties properties,
          required String token}) async =>
      await _storage.write(key: properties.name, value: token);

  Future<String?> load({required JwtStoreProperties properties}) async =>
      await _storage.read(key: properties.name);

  Future<void> delete(JwtStoreProperties properties) async =>
      await _storage.delete(key: properties.name);
}
