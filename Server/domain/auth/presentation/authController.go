package presentation

import (
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/auth/service"
	"Server/domain/user/entity"
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
	if err := ctx.Bind(req); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	user := entity.NewUser(req.Id(), req.Password())
	err := c.authService.SignIn(&user)
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.NoContent(200)
}

func (c *AuthController) SignUp(ctx echo.Context) error {
	req := new(request.SignUpRequest)
	if err := ctx.Bind(req); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	user := entity.NewUser(req.Id(), req.Password(), req.Name())
	err := c.authService.SignUp(user) //NewUser로 받아온 user는 주소값을 가지고 있음
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.NoContent(200)
}
