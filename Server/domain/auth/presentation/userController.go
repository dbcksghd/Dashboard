package presentation

import (
	"Server/domain/auth/entity"
	"Server/domain/auth/presentation/dto/request"
	"Server/domain/auth/service"
	"github.com/labstack/echo/v4"
)

type UserController struct {
	userService service.UserService
}

func NewUserController(userService service.UserService) *UserController {
	return &UserController{
		userService: userService,
	}
}

func (c *UserController) SignIn(ctx echo.Context) error {
	req := new(request.SignInRequest)
	if err := ctx.Bind(req); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	user := entity.User{Id: req.Id, Password: req.Password}
	err := c.userService.SignIn(&user)
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.NoContent(200)
}

func (c *UserController) SignUp(ctx echo.Context) error {
	req := new(request.SignUpRequest)
	if err := ctx.Bind(req); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	user := entity.NewUser(req.Id, req.Password, req.Name)
	err := c.userService.SignUp(user) //NewUser로 받아온 user는 주소값을 가지고 있음
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.NoContent(200)
}
