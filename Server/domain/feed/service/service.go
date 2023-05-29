package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/repository"
	"errors"
)

type FeedService struct {
	feedRepository repository.FeedRepository
}

func NewFeedService(feedRepository repository.FeedRepository) *FeedService {
	return &FeedService{feedRepository: feedRepository}
}

func (f *FeedService) CreateFeed(feed *entity.Feed) error {
	if err := f.feedRepository.CreateFeed(feed); err != nil {
		return errors.New("게시글 생성 실패")
	}
	return nil
}