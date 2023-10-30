import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:client/data/dto/request/auth/sign_in_request_dto.dart';
import 'package:network_module/network_module.dart';

sealed class AuthEndpoint extends DashboardEndpoint {
  AuthEndpoint();

  factory AuthEndpoint.signIn({required SignInRequestDTO signInRequestDTO}) =
      SignIn;

  @override
  BaseRequestDTO? get body => switch (this) {
        SignIn(signInRequestDTO: final signInRequestDTO) => signInRequestDTO,
      };

  @override
  Map<int, Exception> get errorMap => switch (this) { SignIn() => {} };

  @override
  DashboardRestAPIDomain get domain => DashboardRestAPIDomain.auth;

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
