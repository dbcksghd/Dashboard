package entity

type Comment struct {
	id        int    `gorm:"column:id"`
	postId    int    `gorm:"column:postId"`
	writeTime string `gorm:"column:writeTime"` //db에 있는 컬럼 이름이랑 강제 매칭
	comment   string `gorm:"column:comment"`
}

func NewComment(postId int, writeTime, comment string) *Comment {
	return &Comment{
		postId:    postId,
		writeTime: writeTime,
		comment:   comment,
	}
}

func (c *Comment) Id() int {
	return c.id
}

func (c *Comment) PostId() int {
	return c.postId
}

func (c *Comment) WriteTime() string {
	return c.writeTime
}

func (c *Comment) Comment() string {
	return c.comment
}
