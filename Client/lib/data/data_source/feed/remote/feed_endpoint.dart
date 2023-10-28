import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:network_module/network_module.dart';

sealed class FeedEndpoint extends DashboardEndpoint {
  FeedEndpoint();

  factory FeedEndpoint.getAllFeeds() = GetAllFeeds;

  @override
  BaseRequestDTO? get body => switch (this) { GetAllFeeds() => null };

  @override
  Map<int, Error> get errorMap => switch (this) { GetAllFeeds() => {} };

  @override
  DashboardRestAPIDomain get domain => DashboardRestAPIDomain.feed;

  @override
  HTTPMethod get httpMethod =>
      switch (this) { GetAllFeeds() => HTTPMethod.get };

  @override
  JwtTokenType get jwtTokenType =>
      switch (this) { GetAllFeeds() => JwtTokenType.accessToken };

  @override
  String get path => switch (this) { GetAllFeeds() => "/feed" };

  @override
  Map<String, dynamic> get queryParam => {};
}

final class GetAllFeeds extends FeedEndpoint {}
