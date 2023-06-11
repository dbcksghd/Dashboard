package response

type SignInResponse struct {
	TokenResponse TokenResponse `json:"tokenResponse"`
	Message       string        `json:"message"`
}

type TokenResponse struct {
	AccessToken  string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
}
