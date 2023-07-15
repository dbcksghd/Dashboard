package service

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/auth/presentation/dto/response"
	"Server/domain/auth/repository"
	"github.com/labstack/echo/v4"
	"net/http"
)

type AuthService struct {
	authRepository repository.AuthRepository
}

func NewUserService(authRepository repository.AuthRepository) *AuthService {
	return &AuthService{
		authRepository: authRepository,
	}
}

func (s *AuthService) SignIn(req *request.SignInRequest, c echo.Context) error {
	if err := s.authRepository.SignIn(req); err != nil {
		return c.JSON(http.StatusNotFound, err)
	}
	res := response.SignInResponse{
		Message: "파싱 성공",
		TokenResponse: response.TokenResponse{
			AccessToken: "accessToken", RefreshToken: "refreshToken",
		},
	}
	return c.JSON(200, res)
}

func (s *AuthService) SignUp(req *request.SignUpRequest, c echo.Context) error {
	if err := s.authRepository.SignUp(req); err != nil {
		return c.JSON(404, map[string]string{"message": "회원가입 실패"})
	}
	return c.NoContent(201)
}
