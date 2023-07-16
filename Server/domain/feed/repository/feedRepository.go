package repository

import (
	"Server/domain/feed/entity"
	"database/sql"
)

type FeedRepository struct {
	db *sql.DB
}

func NewFeedRepository(db *sql.DB) *FeedRepository {
	return &FeedRepository{
		db: db,
	}
}

func (r *FeedRepository) CrateFeed(feed *entity.Feed) error {
	result := r.db.Table("feed").Create(feed)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *FeedRepository) FindAllFeeds() (*[]entity.Feed, error) {
	res := []entity.Feed{}
	err := r.db.Table("feed").Find(&res)
	if err.Error != nil {
		return &res, err.Error
	}
	return &res, nil
}

func (r *FeedRepository) UpdateFeed(newFeed *entity.Feed) error {
	result := r.db.Table("feed").Where("id = ?", newFeed.Id).Save(newFeed)
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
