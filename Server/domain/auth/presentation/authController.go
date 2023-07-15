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
	res := c.authService.SignIn(req)
	if res.Message == "" {
		return ctx.JSON(401, "넌 안돼 ㅋ")
	}
	return ctx.JSON(200, res)
}

func (c *AuthController) SignUp(ctx echo.Context) error {
	req := new(request.SignUpRequest)
	_ = ctx.Bind(req)
	res := c.authService.SignUp(req)
	if res != nil {
		return ctx.JSON(500, "회원가입 실패")
	}
	return ctx.NoContent(201)
}
