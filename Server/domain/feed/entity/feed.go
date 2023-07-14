package entity

type Feed struct {
	id      int    `gorm:"column:id"`
	title   string `gorm:"column:title"`
	content string `gorm:"column:content"`
}

func NewFeed(title, content string) *Feed {
	return &Feed{
		title:   title,
		content: content,
	}
}

func UpdateFeed(id int, title, content string) *Feed {
	return &Feed{
		id:      id,
		title:   title,
		content: content,
	}
}

func (f *Feed) Id() int {
	return f.id
}

func (f *Feed) Title() string {
	return f.title
}

func (f *Feed) Content() string {
	return f.content
}
