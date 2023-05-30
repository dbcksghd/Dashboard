package repository

import (
	"Server/domain/feed/entity"
	"Server/domain/feed/presentation/dto/response"
	"gorm.io/gorm"
)

type BoardRepository struct {
	db *gorm.DB
}

func (r *BoardRepository) CrateFeed(feed *entity.Feed) error {
	result := r.db.Table("feed").Create(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *BoardRepository) FindAllFeeds() (response.FeedResponse, error) {
	var res response.FeedResponse
	result := r.db.Table("feed").Find(&res)
	if result.Error != nil {
		return res, result.Error
	}
	return res, nil
}

func (r *BoardRepository) UpdateFeed(feed *entity.Feed, id int) error {
	result := r.db.Table("feed").Find(feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	result = r.db.Table("feed").Save(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *BoardRepository) DeleteFeed(id int) error {
	feed := entity.Feed{}
	result := r.db.Table("feed").Find(&feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	result = r.db.Table("feed").Delete(&feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
