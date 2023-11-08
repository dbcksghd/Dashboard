import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:network_module/network_module.dart';

sealed class RefreshEndpoint extends DashboardEndpoint {
  RefreshEndpoint();

  factory RefreshEndpoint.refresh() = Refresh;

  @override
  BaseRequestDTO? get body => null;

  @override
  DashboardRestAPIDomain get domain => DashboardRestAPIDomain.auth;

  @override
  Map<int, Exception> get errorMap => {};

  @override
  HTTPMethod get httpMethod => HTTPMethod.get;

  @override
  JwtTokenType get jwtTokenType => JwtTokenType.refreshToken;

  @override
  String get path => "/auth/token-reissue";

  @override
  Map<String, dynamic>? get queryParam => null;
}

final class Refresh extends RefreshEndpoint {}
