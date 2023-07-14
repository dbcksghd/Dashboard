package requset

type UpdateRequest struct {
	id      int    `gorm:"column:id"`
	title   string `gorm:"column:title"`
	content string `gorm:"column:content"`
}

func (u *UpdateRequest) Id() int {
	return u.id
}

func (u *UpdateRequest) Title() string {
	return u.title
}

func (u *UpdateRequest) Content() string {
	return u.content
}

func NewUpdateRequest(id int, title string, content string) *UpdateRequest {
	return &UpdateRequest{id: id, title: title, content: content}
}

type CreateRequest struct {
	title   string `gorm:"column:title"`
	content string `gorm:"column:content"`
}

func (c *CreateRequest) Title() string {
	return c.title
}

func (c *CreateRequest) Content() string {
	return c.content
}

func NewCreateRequest(title string, content string) *CreateRequest {
	return &CreateRequest{title: title, content: content}
}
