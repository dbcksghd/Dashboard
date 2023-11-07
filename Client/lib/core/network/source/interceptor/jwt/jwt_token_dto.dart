import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:network_module/network_module.dart';

final class JWTTokenDTO extends BaseResponseDTO<JwtTokenEntity> {
  late String accessToken,
      refreshToken,
      accessTokenExpireAt,
      refreshTokenExpireAt;

  JWTTokenDTO();

  factory JWTTokenDTO.fromJson(Map<String, dynamic> json) => JWTTokenDTO()
    ..accessToken = json['accessToken']
    ..refreshToken = json['refreshToken']
    ..accessTokenExpireAt = json['access_token_expire_at']
    ..refreshTokenExpireAt = json['refresh_token_expire_at'];

  @override
  fromJson(Map<String, dynamic> json) => JWTTokenDTO().fromJson(json);

  @override
  JwtTokenEntity toEntity() => JwtTokenEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
        accessTokenExpireAt: accessTokenExpireAt,
        refreshTokenExpireAt: refreshTokenExpireAt,
      );
}
