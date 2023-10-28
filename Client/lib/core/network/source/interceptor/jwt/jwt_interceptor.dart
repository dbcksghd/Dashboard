import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:client/core/network/interface/endpoint/dashboard_request_options.dart';
import 'package:network_module/network_module.dart';

class JWTInterceptor extends Interceptor<DashboardRequestOptions> {
  final JwtStore _jwtStore;

  JWTInterceptor({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  @override
  Future<void> onRequest(DashboardRequestOptions options) async {
    if (JwtStoreProperties.accessToken.name == options.jwtTokenType.name) {
      String accessToken =
          await _jwtStore.load(properties: JwtStoreProperties.accessToken);
      if (accessToken.isNotEmpty) {
        options.headers["Authorization"] = "Bearer $accessToken";
      }
    }
  }

  @override
  Future<void> onResponse(Response<dynamic> response) async {
    if (response.data is! List && response.data['access_token'] != null) {
      await _jwtStore.save(
          properties: JwtStoreProperties.accessToken,
          token: response.data['access_token']);
      await _jwtStore.save(
          properties: JwtStoreProperties.refreshToken,
          token: response.data['refresh_token']);
    }
  }

  @override
  Future<void> onError(Object error) async {}
}
