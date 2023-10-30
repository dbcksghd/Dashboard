package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/repository"
	"github.com/labstack/echo/v4"
	"net/http"
)

type FeedService struct {
	repository repository.FeedRepository
}

func NewFeedService(repository repository.FeedRepository) *FeedService {
	return &FeedService{
		repository: repository,
	}
}

func (f *FeedService) CreateFeed(req *requset.CreateFeedRequest, c echo.Context) error {
	newFeed := entity.Feed{Title: req.Title, Content: req.Content}
	if err := f.repository.CrateFeed(&newFeed); err != nil {
		return c.JSON(http.StatusNotFound, "게시글 생성 실패")
	}
	return c.NoContent(201)
}

func (f *FeedService) UpdateFeed(req *requset.UpdateFeedRequest, c echo.Context) error {
	updateFeed := entity.Feed{FeedId: req.Id, Title: req.Title, Content: req.Content}
	if err := f.repository.UpdateFeed(&updateFeed); err != nil {
		return c.JSON(http.StatusNotFound, "게시글 수정 실패")
	}
	return c.NoContent(201)
}

func (f *FeedService) DeleteFeed(id int, c echo.Context) error {
	if err := f.repository.DeleteFeed(id); err != nil {
		return c.JSON(http.StatusNotFound, "게시글 삭제 실패")
	}
	return c.NoContent(201)
}

func (f *FeedService) FindAllFeeds(c echo.Context) error {
	feeds, err := f.repository.FindAllFeeds()
	if err != nil {
		return c.JSON(http.StatusNotFound, "게시글 불러오기 실패")
	}
	if len(feeds) == 0 {
		return c.JSON(http.StatusOK, []entity.Feed{})
	}
	return c.JSON(200, feeds)
}
