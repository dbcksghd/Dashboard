import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_authorizable.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:network_module/network_module.dart';

sealed class AuthEndpoint extends DashboardEndpoint {
  AuthEndpoint();

  factory AuthEndpoint.signIn({required SignInRequestDTO signInRequestDTO}) =
      SignIn;

  @override
  BaseRequestDTO? get body => switch (this) { SignIn() => SignInRequestDTO() };

  @override
  Map<int, Error> get errorMap => switch (this) { SignIn() => {} };

  @override
  HTTPMethod get httpMethod => switch (this) { SignIn() => HTTPMethod.post };

  @override
  JwtTokenType get jwtTokenType =>
      switch (this) { SignIn() => JwtTokenType.none };

  @override
  String get path => switch (this) { SignIn() => "/auth/sign-in" };

  @override
  Map<String, dynamic>? get queryParam => {};
}

final class SignIn extends AuthEndpoint {
  SignInRequestDTO signInRequestDTO;

  SignIn({required this.signInRequestDTO});
}
