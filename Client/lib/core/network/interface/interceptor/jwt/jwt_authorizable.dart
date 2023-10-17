enum JwtTokenType { accessToken, refreshToken, none }

abstract interface class JwtAuthorizable {
  JwtTokenType get jwtTokenType;
}
