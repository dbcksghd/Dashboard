import 'package:client/Repository/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:client/Model/sign_in_response.dart';

class SignInViewModel with ChangeNotifier {
  late final SignInRepository _repository;

  SignInResponse? _response = SignInResponse();
  bool _success = false;

  bool get success => _success;

  SignInViewModel() {
    _repository = SignInRepository();
  }

  Future<void> signIn(String id, password) async {
    _response = await _repository.signIn(id, password);
    if (_response != null) {
      _success = true;
    }
    notifyListeners();
  }
}
