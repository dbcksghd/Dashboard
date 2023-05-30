package repository

import (
	"Server/domain/feed/entity"
	"fmt"
	"gorm.io/gorm"
)

type FeedRepository struct {
	db *gorm.DB
}

func NewFeedRepository(db *gorm.DB) *FeedRepository {
	return &FeedRepository{
		db: db,
	}
}

func (r *FeedRepository) CrateFeed(feed *entity.Feed) error {
	result := r.db.Table("feed").Create(&feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *FeedRepository) FindAllFeeds() ([]entity.Feed, error) {
	res := []entity.Feed{}
	result := r.db.Table("feed").Find(&res)
	if result.Error != nil {
		return res, result.Error
	}
	fmt.Println(res)
	return res, nil
}

func (r *FeedRepository) UpdateFeed(feed *entity.Feed, id int) error {
	result := r.db.Table("feed").Find(&feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	result = r.db.Table("feed").Save(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *FeedRepository) DeleteFeed(id int) error {
	feed := entity.Feed{}
	result := r.db.Table("feed").Delete(&feed, "id = ?", id)
	if result.Error != nil {
		return result.Error
	}
	return nil
}
