package entity

type User struct {
	Id       string `gorm:"column:id"`
	Password string `gorm:"column:password"`
	Name     string `gorm:"column:name"`
}
