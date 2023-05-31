package presentation

import (
	"Server/domain/comment/entity"
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
	req := new(request.CreateRequest)
	if err := ctx.Bind(req); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	comment := entity.NewComment(req.PostId, req.WriteTime, req.Comment)
	err := c.commentService.CreateComment(comment)
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.NoContent(201)
}

func (c *CommentController) name(ctx echo.Context) error {
	reqPostId, err := strconv.Atoi(ctx.QueryParam("postId"))
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	if err := ctx.Bind(reqPostId); err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	comments, err := c.commentService.FindAllFeedsInFeed(reqPostId)
	if err != nil {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	if len(*comments) == 0 {
		return ctx.JSON(500, map[string]string{"error": err.Error()})
	}
	return ctx.JSON(200, comments)
}
