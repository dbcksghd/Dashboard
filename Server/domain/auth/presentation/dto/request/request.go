package request

type SignUpRequest struct {
	Id       string `gorm:"column:id"`
	Password string `gorm:"column:password"`
	Name     string `gorm:"column:name"`
}

type SignInRequest struct {
	Id       string `gorm:"column:id"`
	Password string `gorm:"column:password"`
}
