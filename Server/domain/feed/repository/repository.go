package repository

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/response"
)

type FeedRepository interface {
	CreateFeed(feed *entity.Feed) error
	FindAllFeeds() (response.FeedResponse, error)
	DeleteFeed(id int) error
	UpdateFeed(feed *entity.Feed) error
}
