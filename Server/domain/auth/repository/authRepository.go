package repository

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/user/entity"
	"errors"
	"gorm.io/gorm"
)

type AuthRepository struct {
	db *gorm.DB
}

func NewAuthRepository(db *gorm.DB) *AuthRepository {
	return &AuthRepository{
		db: db,
	}
}

func (r *AuthRepository) SignIn(req *request.SignInRequest) error {
	u := entity.User{}
	result := r.db.Table("user").Where("id = ? and password = ?", req.Id, req.Password).Find(&u)
	if result.Error != nil {
		return result.Error
	}
	if u.Id == "" || u.Password == "" {
		return errors.New("등록된 유저가 없음")
	}
	return nil
}

func (r *AuthRepository) SignUp(req *request.SignUpRequest) error {
	result := r.db.Table("auth").Create(&req)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
