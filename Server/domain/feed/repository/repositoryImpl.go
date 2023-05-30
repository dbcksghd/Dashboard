package repository

import (
	"Server/domain/feed/presentation/dto/requset"
	"Server/domain/feed/presentation/dto/response"
	"gorm.io/gorm"
)

type FeedRepositoryImpl struct{}

func (receiver FeedRepositoryImpl) CrateFeed(feed *requset.CreateRequest, db *gorm.DB) error {
	result := db.Table("feed").Create(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (receiver FeedRepositoryImpl) FindAllFeeds(db *gorm.DB) (response.FeedResponse, error) {
	var res response.FeedResponse
	result := db.Table("feed").Find(&res)
	if result.Error != nil {
		return res, result.Error
	}
	return res, nil
}

func (receiver FeedRepositoryImpl) UpdateFeed(feed *requset.UpdateRequest, db *gorm.DB) error {
	result := db.Table("feed").Find(feed, "id = ?", feed.Id)
	if result.Error != nil {
		return result.Error
	}
	result = db.Table("feed").Save(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
