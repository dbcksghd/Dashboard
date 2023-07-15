package presentation

import (
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
	_ = c.Bind(req)
	return f.feedService.CreateFeed(req, c)
}

func (f *FeedController) UpdateFeed(c echo.Context) error {
	req := new(requset.UpdateRequest)
	_ = c.Bind(req)
	return f.feedService.UpdateFeed(req, c)
}

func (f *FeedController) DeleteFeed(c echo.Context) error {
	reqId, _ := strconv.Atoi(c.QueryParam("id"))
	return f.feedService.DeleteFeed(reqId, c)
}

func (f *FeedController) FindAllFeeds(c echo.Context) error {
	return f.feedService.FindAllFeeds(c)
}
