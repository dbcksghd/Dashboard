import 'package:client/domain/entity/auth/jwt_token_entity.dart';
import 'package:network_module/network_module.dart';

final class SignInResponseDTO extends BaseResponseDTO<JwtTokenEntity> {
  late String message, accessToken, refreshToken;

  SignInResponseDTO();

  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      SignInResponseDTO()
        ..accessToken = json['tokenResponse']['accessToken']
        ..refreshToken = json['tokenResponse']['refreshToken']
        ..message = json['message'];

  @override
  fromJson(Map<String, dynamic> json) => SignInResponseDTO.fromJson(json);

  @override
  JwtTokenEntity toEntity() =>
      JwtTokenEntity(accessToken: accessToken, refreshToken: refreshToken);
}
