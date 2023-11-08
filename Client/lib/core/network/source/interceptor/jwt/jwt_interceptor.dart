import 'package:client/core/jwt_store/interface/jwt_store.dart';
import 'package:client/core/jwt_store/interface/jwt_store_properties.dart';
import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/source/interceptor/jwt/jwt_token_dto.dart';
import 'package:client/core/network/source/interceptor/jwt/refresh/refresh_endpoint.dart';
import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:network_module/network_module.dart';

class JWTInterceptor extends Interceptor<DashboardEndpoint> {
  final JwtStore _jwtStore;

  JWTInterceptor({required JwtStore jwtStore}) : _jwtStore = jwtStore;

  @override
  Future<void> onRequest(DashboardEndpoint endpoint) async {
    if (JwtStoreProperties.accessToken.name == endpoint.jwtTokenType.name) {
      String accessTokenExpireAt = await _jwtStore.load(
          properties: JwtStoreProperties.accessTokenExpireAt);

      if (DateTime.now()
          .isBefore(DateTime.now().add(const Duration(seconds: 1)))) {
        RefreshEndpoint refreshEndpoint = RefreshEndpoint.refresh();

        String refreshToken =
            await _jwtStore.load(properties: JwtStoreProperties.refreshToken);

        refreshEndpoint.headers["refreshToken"] = refreshToken;

        final Response<dynamic> response =
            await Network.network.request(options: refreshEndpoint);

        final jwtTokenEntity = JWTTokenDTO.fromJson(response.data).toEntity();

        await saveAllTokenInfo(jwtTokenEntity: jwtTokenEntity);
      }
      endpoint.headers['accessToken'] =
          await _jwtStore.load(properties: JwtStoreProperties.accessToken);
    }
  }

  @override
  Future<void> onResponse(
      DashboardEndpoint endpoint, Response<dynamic> response) async {
    if (endpoint.domain == DashboardRestAPIDomain.auth &&
        response.data['accessToken'] != null) {
      JwtTokenEntity jwtTokenEntity =
          JWTTokenDTO.fromJson(response.data).toEntity();
      await saveAllTokenInfo(jwtTokenEntity: jwtTokenEntity);
    }
  }

  @override
  Future<void> onError(Object error) async {}
}

extension on JWTInterceptor {
  Future<void> saveAllTokenInfo(
      {required JwtTokenEntity jwtTokenEntity}) async {
    await _jwtStore.save(
        properties: JwtStoreProperties.accessToken,
        token: jwtTokenEntity.accessToken);
    await _jwtStore.save(
        properties: JwtStoreProperties.accessTokenExpireAt,
        token: jwtTokenEntity.accessTokenExpireAt);
    await _jwtStore.save(
        properties: JwtStoreProperties.refreshToken,
        token: jwtTokenEntity.refreshToken);
    await _jwtStore.save(
        properties: JwtStoreProperties.refreshTokenExpireAt,
        token: jwtTokenEntity.refreshTokenExpireAt);
  }
}
