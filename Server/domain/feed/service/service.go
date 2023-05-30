package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/repository"
	"errors"
)

type FeedService struct {
	repositoryImpl repository.FeedRepositoryImpl
}

func (f *FeedService) CreateFeed(feed *entity.Feed) error {
	if err := f.repositoryImpl.CrateFeed(feed); err != nil {
		return errors.New("게시글 생성 실패")
	}
	return nil
}

func (f *FeedService) UpdateFeed(feed *entity.Feed, id int) error {
	if err := f.repositoryImpl.UpdateFeed(feed, id); err != nil {
		return errors.New("게시글 수정 실패")
	}
	return nil
}

func (f *FeedService) DeleteFeed(feed *entity.Feed) error {
	if err := f.repositoryImpl.DeleteFeed(feed); err != nil {
		return errors.New("게시글 삭제 실패")
	}
	return nil
}
