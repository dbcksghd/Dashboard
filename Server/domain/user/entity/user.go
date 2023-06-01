package entity

type User struct {
	Id       string `json:"id"`
	Password string `json:"password"`
	Name     string `json:"name"`
}

func NewUser(id, password, name string) *User {
	return &User{
		Id:       id,
		Password: password,
		Name:     name,
	}
}
