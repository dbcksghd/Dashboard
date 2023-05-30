package repository

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/response"
	"gorm.io/gorm"
)

type FeedRepositoryImpl struct {
	repository FeedRepository
}

func (receiver FeedRepositoryImpl) CrateFeed(feed *entity.Feed, db *gorm.DB) error {
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

func (receiver FeedRepositoryImpl) UpdateFeed(feed *entity.Feed, id int, db *gorm.DB) error {
	result := db.Table("feed").Find(feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	result = db.Table("feed").Save(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (receiver FeedRepositoryImpl) DeleteFeed(id int, db *gorm.DB) error {
	feed := entity.Feed{}
	result := db.Table("feed").Find(&feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	result = db.Table("feed").Delete(&feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
