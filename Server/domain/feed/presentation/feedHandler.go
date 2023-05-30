package presentation

import "github.com/labstack/echo/v4"

type FeedHandler struct {
	feedController FeedController
}

func NewFeedHandler(feedController FeedController) *FeedHandler {
	return &FeedHandler{
		feedController: feedController,
	}
}

func (f *FeedHandler) RegisterRoutes(e *echo.Echo) {
	e.POST("/feed", f.feedController.CreateFeed)
	e.GET("/feed", f.feedController.FindAllFeeds)
	e.PATCH("/feed", f.feedController.UpdateFeed)
	e.DELETE("/feed", f.feedController.DeleteFeed)
}
