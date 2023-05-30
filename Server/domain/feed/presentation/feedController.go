package presentation

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/service"
	"github.com/labstack/echo/v4"
)

type FeedController struct {
	feedService service.FeedService
}

func NewFeedHandler(feedService service.FeedService) *FeedController {
	return &FeedController{
		feedService: feedService,
	}
}

func (h *FeedController) CreateFeed(c echo.Context) error {
	req := new(requset.CreateRequest)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	feed := entity.NewFeed(req.Title, req.Content)
	err := h.feedService.CreateFeed(feed)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}

func (h *FeedController) UpdateFeed(c echo.Context) error {
	req := new(requset.UpdateRequest)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	feed := entity.NewFeed(req.Title, req.Content)
	err := h.feedService.UpdateFeed(feed, req.Id)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}
