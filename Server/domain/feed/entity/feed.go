package entity

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func CreateFeed(title, content string) *Feed {
	return &Feed{
		Title:   title,
		Content: content,
	}
}

func UpdateFeed(id int, title, content string) *Feed {
	return &Feed{
		Id:      id,
		Title:   title,
		Content: content,
	}
}
