package entity

type Comment struct {
	Id        int    `json:"id"`
	PostId    int    `gorm:"column:postId"`
	WriteTime string `gorm:"column:writeTime"` //db에 있는 컬럼 이름이랑 강제 매칭
	Comment   string `json:"comment"`
}

func NewComment(postId int, writeTime, comment string) *Comment {
	return &Comment{
		PostId:    postId,
		WriteTime: writeTime,
		Comment:   comment,
	}
}
