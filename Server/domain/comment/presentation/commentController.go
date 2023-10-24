package presentation

import (
	"Server/domain/comment/presentation/dto/request"
	"Server/domain/comment/service"
	"github.com/labstack/echo/v4"
	"strconv"
)

type CommentController struct {
	commentService service.CommentService
}

func NewCommentController(commentService service.CommentService) *CommentController {
	return &CommentController{
		commentService: commentService,
	}
}

func (c *CommentController) CreateComment(ctx echo.Context) error {
	req := new(request.CreateCommentRequest)
	_ = ctx.Bind(req)
	return c.commentService.CreateComment(req, ctx)
}

func (c *CommentController) FindAllCommentsInFeed(ctx echo.Context) error {
	postId, _ := strconv.Atoi(ctx.QueryParam("postId"))
	return c.commentService.FindAllCommentsInFeed(postId, ctx)
}
