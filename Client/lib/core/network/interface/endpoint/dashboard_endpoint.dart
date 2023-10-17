import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_authorizable.dart';
import 'package:network_module/network_module.dart';

abstract class DashboardEndpoint implements DioRequestOptions, JwtAuthorizable {
  String get path;

  DashboardRestAPIDomain get domain;

  Map<int, Error> get errorMap;

  @override
  String get baseUrl => "http://localhost:8080$path";

  @override
  Map<String, String> get headers => {'Content-Type': 'application/json'};
}
