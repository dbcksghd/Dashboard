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

func (f *FeedService) UpdateFeed(feed *entity.Feed) error {
	if err := f.repository.UpdateFeed(feed); err != nil {
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

func (f *FeedService) FindAllFeeds() (*[]entity.Feed, error) {
	feeds, err := f.repository.FindAllFeeds()
	if err != nil {
		return feeds, errors.New("게시글 불러오기 실패")
	}
	return feeds, nil
}
