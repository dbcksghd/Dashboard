package presentation

import "github.com/labstack/echo/v4"

type AuthHandler struct {
	authController AuthController
}

func NewAuthHandler(authController AuthController) *AuthHandler {
	return &AuthHandler{
		authController: authController,
	}
}

func (h *AuthHandler) UserRoutes(e *echo.Echo) {
	e.POST("/auth/sign-in", h.authController.SignIn)
	e.POST("/auth/sign-up", h.authController.SignUp)
}
