package entity

type Comment struct {
	Id        int    `json:"id"`
	FeedId    int    `json:"feedId"`
	WriteTime string `json:"writeTime"`
	Comment   string `json:"comment"`
}
