enum JwtTokenType { accessToken, refreshToken, none }

abstract class JwtAuthorizable {
  JwtTokenType get jwtTokenType;
}
