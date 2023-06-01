package presentation

import "github.com/labstack/echo/v4"

type CommentHandler struct {
	commentController CommentController
}

func NewCommentHandler(commentController CommentController) *CommentHandler {
	return &CommentHandler{
		commentController: commentController,
	}
}

func (h *CommentHandler) CommentRoutes(e *echo.Echo) {
	e.POST("/comment", h.commentController.CreateComment)
	e.GET("/comment", h.commentController.FindAllCommentsInFeed)
}
