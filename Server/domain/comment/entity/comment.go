package entity

type Comment struct {
	Id        int    `gorm:"column:id"`
	PostId    int    `gorm:"column:postId"`
	WriteTime string `gorm:"column:writeTime"` //db에 있는 컬럼 이름이랑 강제 매칭
	Comment   string `gorm:"column:comment"`
}
