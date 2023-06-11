package service

import (
	"Server/domain/auth/repository"
	"Server/domain/user/entity"
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

func (s *AuthService) SignIn(user *entity.User) error {
	if err := s.authRepository.SignIn(user); err != nil {
		return errors.New("로그인 실패")
	}
	return nil
}

func (s *AuthService) SignUp(user *entity.User) error {
	if err := s.authRepository.SignUp(user); err != nil {
		return errors.New("회원가입 실패")
	}
	return nil
}
