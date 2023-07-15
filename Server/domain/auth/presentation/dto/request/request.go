package request

type SignUpRequest struct {
	id       string `gorm:"column:id"`
	password string `gorm:"column:password"`
	name     string `gorm:"column:name"`
}

func (s *SignUpRequest) Id() string {
	return s.id
}

func (s *SignUpRequest) Password() string {
	return s.password
}

func (s *SignUpRequest) Name() string {
	return s.name
}

type SignInRequest struct {
	id       string `gorm:"column:id"`
	password string `gorm:"column:password"`
}

func (s *SignInRequest) Id() string {
	return s.id
}

func (s *SignInRequest) Password() string {
	return s.password
}
