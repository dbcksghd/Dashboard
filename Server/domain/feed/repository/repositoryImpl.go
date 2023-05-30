package repository

import (
	"Server/domain/feed/presentation/dto/requset"
	"errors"
	"gorm.io/gorm"
)

type FeedRepositoryImpl struct{}

func (receiver FeedRepositoryImpl) CrateFeed(feed *requset.CreateRequest, db *gorm.DB) error {
	result := db.Table("feed").Create(feed)
	if result.Error != nil {
		return errors.New(result.Error.Error())
	}
	return nil
}
