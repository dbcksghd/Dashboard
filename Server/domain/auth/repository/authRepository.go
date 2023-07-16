package repository

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/user/entity"
	"database/sql"
	"errors"
)

type AuthRepository struct {
	db *sql.DB
}

func NewAuthRepository(db *sql.DB) *AuthRepository {
	return &AuthRepository{
		db: db,
	}
}

func (r *AuthRepository) SignIn(req *request.SignInRequest) error {
	u := entity.User{}
	err := r.db.QueryRow("select * from user where id = ? and password = ?", req.Id, req.Password).Scan(&u.Id, &u.Password, &u.Name)
	if err != nil {
		return err
	}
	if u.Id == "" || u.Password == "" {
		return errors.New("등록된 유저가 없음")
	}
	return nil
}

func (r *AuthRepository) SignUp(req *request.SignUpRequest) error {
	_, err := r.db.Exec("insert into user(id, password, name) values (?, ?, ?)", req.Id, req.Password, req.Name)
	if err != nil {
		return err
	}
	return nil
}
