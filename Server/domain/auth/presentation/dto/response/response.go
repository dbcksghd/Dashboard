package response

type SignInResponse struct {
	TokenResponse TokenResponse
	Message       string
}

type TokenResponse struct {
	AccessToken  string
	RefreshToken string
}
