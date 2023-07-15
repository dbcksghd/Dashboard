package presentation

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/auth/service"
	"github.com/labstack/echo/v4"
)

type AuthController struct {
	authService service.AuthService
}

func NewAuthController(authService service.AuthService) *AuthController {
	return &AuthController{
		authService: authService,
	}
}

func (c *AuthController) SignIn(ctx echo.Context) error {
	req := new(request.SignInRequest)
	_ = ctx.Bind(req)
	return c.authService.SignIn(req, ctx)
}

func (c *AuthController) SignUp(ctx echo.Context) error {
	req := new(request.SignUpRequest)
	_ = ctx.Bind(req)
	return c.authService.SignUp(req, ctx)
}
