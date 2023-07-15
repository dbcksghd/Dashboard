package service

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/auth/presentation/dto/response"
	"Server/domain/auth/repository"
	"errors"
)

type AuthService struct {
	authRepository repository.AuthRepository
}

func NewUserService(authRepository repository.AuthRepository) *AuthService {
	return &AuthService{
		authRepository: authRepository,
	}
}

func (s *AuthService) SignIn(req *request.SignInRequest) response.SignInResponse {
	if err := s.authRepository.SignIn(req); err != nil {
		return response.SignInResponse{}
	}
	res := response.SignInResponse{
		Message: "파싱 성공",
		TokenResponse: response.TokenResponse{
			AccessToken: "accessToken", RefreshToken: "refreshToken",
		},
	}
	return res
}

func (s *AuthService) SignUp(req *request.SignUpRequest) error {
	if err := s.authRepository.SignUp(req); err != nil {
		return errors.New("회원가입 실패")
	}
	return nil
}
