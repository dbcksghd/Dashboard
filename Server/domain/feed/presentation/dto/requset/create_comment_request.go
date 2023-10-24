package requset

type CreateCommentRequest struct {
	PostId    int    `gorm:"column:postId"`
	WriteTime string `gorm:"column:writeTime"`
	Comment   string `gorm:"column:comment"`
}
