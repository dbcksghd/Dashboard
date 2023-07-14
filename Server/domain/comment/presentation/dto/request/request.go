package request

type CreateRequest struct {
	postId    int    `gorm:"column:postId"`
	writeTime string `gorm:"column:writeTime"`
	comment   string `gorm:"column:comment"`
}

func (c *CreateRequest) PostId() int {
	return c.postId
}

func (c *CreateRequest) WriteTime() string {
	return c.writeTime
}

func (c *CreateRequest) Comment() string {
	return c.comment
}
