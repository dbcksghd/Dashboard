import 'package:client/Repository/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInViewModel with ChangeNotifier {
  late final SignInRepository _repository;
  var storage = const FlutterSecureStorage();
  bool _success = false;

  bool get success => _success;

  SignInViewModel() {
    _repository = SignInRepository();
  }

  Future<void> signIn(String id, password) async {
    await _repository.signIn(id, password).then((value) {
      if (value.accessToken!.isNotEmpty) {
        _success = true;
        storage.write(key: 'accessToken', value: value.accessToken);
        storage.write(key: 'refreshToken', value: value.refreshToken);
      }
    });
    notifyListeners();
  }
}
