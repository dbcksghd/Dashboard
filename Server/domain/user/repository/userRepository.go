package repository

import (
	"Server/domain/user/entity"
	"errors"
	"gorm.io/gorm"
)

type UserRepository struct {
	db *gorm.DB
}

func NewUserRepository(db *gorm.DB) *UserRepository {
	return &UserRepository{
		db: db,
	}
}

func (r *UserRepository) SignIn(user *entity.User) error {
	result := r.db.Table("user").Where("id = ?", user.Id, "password = ?", user.Password)
	if result.Error != nil {
		return errors.New("로그인 실패")
	}
	return nil
}

func (r *UserRepository) SignUp(user *entity.User) error {
	result := r.db.Table("user").Create(&user)
	if result.Error != nil {
		return errors.New("이미 존재함")
	}
	return nil
}
