package entity

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func Setter(feed *Feed) *Feed {
	return &Feed{
		Title:   feed.Title,
		Content: feed.Content,
	}
}
