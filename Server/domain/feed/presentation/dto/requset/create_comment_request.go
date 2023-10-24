package requset

type CreateCommentRequest struct {
	FeedId    int    `gorm:"column:feedId"`
	WriteTime string `gorm:"column:writeTime"`
	Content   string `gorm:"column:content"`
}
