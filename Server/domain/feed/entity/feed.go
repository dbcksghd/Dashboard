package entity

type Feed struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

func (f *Feed) Setter(feed *Feed) {
	f.Title = feed.Title
	f.Content = feed.Content
}
