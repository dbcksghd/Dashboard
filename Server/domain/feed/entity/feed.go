package entity

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func NewFeed(title, content string) *Feed {
	return &Feed{
		Title:   title,
		Content: content,
	}
}

func NewUpdateFeed(id int, title, content string) *Feed {
	return &Feed{
		Id:      id,
		Title:   title,
		Content: content,
	}
}

func (f *Feed) Setter(feed *Feed) {
	f.Title = feed.Title
	f.Content = feed.Content
}
