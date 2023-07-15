package entity

type Feed struct {
	Id      int    `gorm:"column:id"`
	Title   string `gorm:"column:title"`
	Content string `gorm:"column:content"`
}
