class JwtTokenEntity {
  String accessToken, refreshToken, accessTokenExpireAt, refreshTokenExpireAt;

  JwtTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpireAt,
    required this.refreshTokenExpireAt,
  });
}
