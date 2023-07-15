package entity

type Comment struct {
	Id        int    `json:"id"`
	PostId    int    `json:"postId"`
	WriteTime string `json:"writeTime"`
	Comment   string `json:"comment"`
}
