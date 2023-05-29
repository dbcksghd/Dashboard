package requset

type UpdateRequest struct {
	Id      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

type CreateRequest struct {
	Title   string `json:"title"`
	Content string `json:"content"`
}
