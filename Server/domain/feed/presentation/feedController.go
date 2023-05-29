package presentation

import (
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/service"
	"github.com/labstack/echo/v4"
)

type FeedHandler struct {
	feedService service.FeedService
}

func NewFeedHandler(feedService service.FeedService) *FeedHandler {
	return &FeedHandler{
		feedService: feedService,
	}
}

func (h *FeedHandler) CreateFeed(c echo.Context) error {
	req := new(requset.Request)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	err := h.feedService.CreateFeed(req.Title, req.Content)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}

func (h *FeedHandler) UpdateFeed(c echo.Context) error {
	req := new(requset.Request)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	err := h.feedService.UpdateFeed(req.Id, req.Title, req.Content)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}
