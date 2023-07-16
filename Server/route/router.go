package route

import (
	"Server/domain/auth/presentation"
	presentation3 "Server/domain/comment/presentation"
	presentation2 "Server/domain/feed/presentation"
	"github.com/labstack/echo/v4"
)

type Router struct {
	authController    presentation.AuthController
	feedController    presentation2.FeedController
	commentController presentation3.CommentController
}

func NewRouter(authController presentation.AuthController, feedController presentation2.FeedController,
	commentController presentation3.CommentController) *Router {
	return &Router{
		authController:    authController,
		feedController:    feedController,
		commentController: commentController,
	}
}

func (r *Router) Routes(e *echo.Echo) {
	e.POST("/auth/sign-in", r.authController.SignIn)
	e.POST("/auth/sign-up", r.authController.SignUp)

	e.POST("/feed", r.feedController.CreateFeed)
	e.GET("/feed", r.feedController.FindAllFeeds)
	e.PATCH("/feed", r.feedController.UpdateFeed)
	e.DELETE("/feed", r.feedController.DeleteFeed)

	e.POST("/comment", r.commentController.CreateComment)
	e.GET("/comment", r.commentController.FindAllCommentsInFeed)
}
