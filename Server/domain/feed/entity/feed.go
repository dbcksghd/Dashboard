package entity

type Feed struct {
	FeedId  int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}
