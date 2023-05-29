package repository

import "Server/domain/feed/entity"

type FeedRepository interface {
	CreateFeed(feed *entity.Feed) error
	FindAllFeeds() ([]*entity.Feed, error)
	DeleteFeed(id int) error
	UpdateFeed(feed *entity.Feed) error
}
