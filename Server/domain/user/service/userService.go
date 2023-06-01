package service

import (
	"Server/domain/user/entity"
	"Server/domain/user/repository"
	"errors"
)

type UserService struct {
	userRepository repository.UserRepository
}

func NewUserService(userRepository repository.UserRepository) *UserService {
	return &UserService{
		userRepository: userRepository,
	}
}

func (s *UserService) SignIn(user *entity.User) error {
	if err := s.userRepository.SignIn(user); err != nil {
		return errors.New("로그인 실패")
	}
	return nil
}

func (s *UserService) SignUp(user *entity.User) error {
	if err := s.userRepository.SignUp(user); err != nil {
		return errors.New("회원가입 실패")
	}
	return nil
}
