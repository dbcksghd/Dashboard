package presentation

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/service"
	"github.com/labstack/echo/v4"
	"strconv"
)

type FeedController struct {
	feedService service.FeedService
}

func NewFeedController(feedService service.FeedService) *FeedController {
	return &FeedController{
		feedService: feedService,
	}
}

func (f *FeedController) CreateFeed(c echo.Context) error {
	req := new(requset.CreateRequest)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	feed := entity.NewFeed(req.Title, req.Content)
	err := f.feedService.CreateFeed(feed)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}

func (f *FeedController) UpdateFeed(c echo.Context) error {
	req := new(requset.UpdateRequest)
	if err := c.Bind(req); err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	feed := entity.UpdateFeed(req.Id, req.Title, req.Content)
	err := f.feedService.UpdateFeed(feed)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}

func (f *FeedController) DeleteFeed(c echo.Context) error {
	reqId, err := strconv.Atoi(c.QueryParam("id"))
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	err = f.feedService.DeleteFeed(reqId)
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.NoContent(201)
}

func (f *FeedController) FindAllFeeds(c echo.Context) error {
	feeds, err := f.feedService.FindAllFeeds()
	if err != nil {
		return c.JSON(500, map[string]string{"error": err.Error()})
	}
	return c.JSON(200, feeds)
}
