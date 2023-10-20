import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:network_module/network_module.dart';

abstract class DashboardRequestOptions implements DioRequestOptions {
  JwtTokenType get jwtTokenType;
}
