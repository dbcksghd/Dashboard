package repository

import (
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/presentation/dto/response"
)

type FeedRepository interface {
	CreateFeed(feed requset.CreateRequest) error
	FindAllFeeds() (response.FeedResponse, error)
	DeleteFeed(id int) error
	UpdateFeed(feed *requset.UpdateRequest) error
}
