import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JwtStoreImpl implements JwtStore {
  final FlutterSecureStorage _storage;

  JwtStoreImpl({required FlutterSecureStorage storage}) : _storage = storage;

  @override
  Future<void> save(
          {required JwtStoreProperties properties,
          required String token}) async =>
      await _storage.write(key: properties.name, value: token);

  @override
  Future<String> load({required JwtStoreProperties properties}) async =>
      await _storage.read(key: properties.name) ?? "";

  @override
  Future<void> delete(JwtStoreProperties properties) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
