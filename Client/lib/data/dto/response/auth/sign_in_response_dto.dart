import 'package:client/domain/entity/auth/sign_in_entity.dart';
import 'package:network_module/network_module.dart';

final class SignInResponseDTO extends BaseResponseDTO<SignInEntity> {
  late String accessToken;
  late String refreshToken;

  SignInResponseDTO();

  factory SignInResponseDTO.fromJson(Map<String, dynamic> json) =>
      SignInResponseDTO()
        ..accessToken = json['access_token']
        ..refreshToken = json['refresh_token'];

  @override
  fromJson(Map<String, dynamic> json) => SignInResponseDTO.fromJson(json);

  @override
  SignInEntity toEntity() =>
      SignInEntity(accessToken: accessToken, refreshToken: refreshToken);
}
