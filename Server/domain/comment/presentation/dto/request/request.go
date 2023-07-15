package request

type CreateRequest struct {
	PostId    int    `gorm:"column:postId"`
	WriteTime string `gorm:"column:writeTime"`
	Comment   string `gorm:"column:comment"`
}
