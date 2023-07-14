package entity

type User struct {
	id       string `gorm:"column:id"`
	password string `gorm:"column:password"`
	name     string `gorm:"column:name"`
}

func NewUser(id, password, name string) *User {
	return &User{
		id:       id,
		password: password,
		name:     name,
	}
}

func (u *User) Id() string {
	return u.id
}

func (u *User) Password() string {
	return u.password
}

func (u *User) Name() string {
	return u.name
}
