package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/repository"
)

type CreateFeedService struct {
	feedRepository repository.FeedRepository
}

func (c *CreateFeedService) Execute(request requset.Request) error {
	feed := entity.Feed{
		Title:   request.Title,
		Content: request.Content,
	}
	if err := c.feedRepository.CreateFeed(&feed); err != nil {
		return err
	}
	return nil
}
