package service

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/repository"
	"errors"
)

type FeedService struct {
	feedRepository repository.FeedRepository
}

func (f *FeedService) CreateFeed(title, content string) error {
	feed := &entity.Feed{
		Title:   title,
		Content: content,
	}
	if err := f.feedRepository.CreateFeed(feed); err != nil {
		return errors.New("게시글 생성 실패")
	}
	return nil
}

func (f *FeedService) UpdateFeed(id int, title, content string) error {
	feed := &entity.Feed{
		Id:      id,
		Title:   title,
		Content: content,
	}
	if err := f.feedRepository.UpdateFeed(feed); err != nil {
		return errors.New("게시글 수정 실패")
	}
	return nil
}

func (f *FeedService) DeleteFeed(feed *entity.Feed) error {
	if err := f.feedRepository.UpdateFeed(feed); err != nil {
		return errors.New("게시글 삭제 실패")
	}
	return nil
}
