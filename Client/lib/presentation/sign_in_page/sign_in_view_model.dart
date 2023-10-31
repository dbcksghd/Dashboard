import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:client/domain/use_case/auth/sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:network_module/network_module.dart';

class SignInViewModel with ChangeNotifier {
  final SignInUseCase _signInUseCase;
  bool _isLoginState = false;

  SignInViewModel({required SignInUseCase signInUseCase})
      : _signInUseCase = signInUseCase;

  bool get isLoginState => _isLoginState;

  Future<void> signIn(SignInRequestDTO signInRequestDTO) async {
    final res = await _signInUseCase.execute(signInRequestDTO);
    switch (res) {
      case Success():
        _isLoginState = true;
        notifyListeners();
      case Failure(exception: final e):
        print("로그인 실패 :$e");
    }
  }
}
