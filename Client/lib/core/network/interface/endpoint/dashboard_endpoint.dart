import 'package:client/core/network/interface/interceptor/jwt/jwt_authorizable.dart';
import 'package:network_module/network_module.dart';

abstract class DashboardEndpoint implements DioRequestOptions, JwtAuthorizable {
  String get path;

  Map<int, Error> get errorMap;

  @override
  String get baseUrl => "http://localhost:8080$path";

  @override
  Map<String, String> get headers => {'Content-Type': 'application/json'};
}
