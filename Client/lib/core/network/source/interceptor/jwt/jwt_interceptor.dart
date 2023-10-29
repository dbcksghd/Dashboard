import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:network_module/network_module.dart';

class JWTInterceptor extends Interceptor<DashboardEndpoint> {
  final JwtStore _jwtStore;

  JWTInterceptor({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  @override
  Future<void> onRequest(DashboardEndpoint endpoint) async {
    if (JwtStoreProperties.accessToken.name == endpoint.jwtTokenType.name) {
      String accessToken =
          await _jwtStore.load(properties: JwtStoreProperties.accessToken);
      if (accessToken.isNotEmpty) {
        endpoint.headers["Authorization"] = "Bearer $accessToken";
      }
    }
  }

  @override
  Future<void> onResponse(
      DashboardEndpoint endpoint, Response<dynamic> response) async {
    if (endpoint.domain.name == DashboardRestAPIDomain.auth.name &&
        response.data['access_token'].toString().isNotEmpty) {
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
