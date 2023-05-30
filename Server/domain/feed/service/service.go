package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/repository"
	"errors"
)

type FeedService struct {
	repository repository.FeedRepository
}

func NewFeedService(repository repository.FeedRepository) *FeedService {
	return &FeedService{
		repository: repository,
	}
}

func (f *FeedService) CreateFeed(feed *entity.Feed) error {
	if err := f.repository.CrateFeed(feed); err != nil {
		return errors.New("게시글 생성 실패")
	}
	return nil
}

func (f *FeedService) UpdateFeed(feed *entity.Feed, id int) error {
	if err := f.repository.UpdateFeed(feed, id); err != nil {
		return errors.New("게시글 수정 실패")
	}
	return nil
}

func (f *FeedService) DeleteFeed(id int) error {
	if err := f.repository.DeleteFeed(id); err != nil {
		return errors.New("게시글 삭제 실패")
	}
	return nil
}
