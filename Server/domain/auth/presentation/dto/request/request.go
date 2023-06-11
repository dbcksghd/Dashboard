package request

type SignUpRequest struct {
	Id       string `json:"id"`
	Password string `json:"password"`
	Name     string `json:"name"`
}

type SignInRequest struct {
	Id       string `json:"id"`
	Password string `json:"password"`
}
