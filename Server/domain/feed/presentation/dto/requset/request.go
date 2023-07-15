package requset

type UpdateRequest struct {
	Id      int    `gorm:"column:id"`
	Title   string `gorm:"column:title"`
	Content string `gorm:"column:content"`
}

type CreateRequest struct {
	Title   string `gorm:"column:title"`
	Content string `gorm:"column:content"`
}
