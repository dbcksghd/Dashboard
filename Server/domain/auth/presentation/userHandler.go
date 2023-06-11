package presentation

import "github.com/labstack/echo/v4"

type UserHandler struct {
	userController UserController
}

func NewUserHandler(userController UserController) *UserHandler {
	return &UserHandler{
		userController: userController,
	}
}

func (h *UserHandler) UserRoutes(e *echo.Echo) {
	e.POST("/auth/sign-in", h.userController.SignIn)
	e.POST("/auth/sign-up", h.userController.SignUp)
}
