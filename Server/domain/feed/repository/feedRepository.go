package repository

import (
	"Server/domain/feed/entity"
	"database/sql"
	"fmt"
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
	_, err := r.db.Exec("insert into feed(id, title, content) values (?, ?, ?)", feed.FeedId, feed.Title, feed.Content)
	if err != nil {
		return err
	}
	return nil
}

func (r *FeedRepository) FindAllFeeds() (feeds []entity.Feed, err error) {
	rows, err := r.db.Query("select * from feed")

	if err != nil {
		return nil, err
	}
	for rows.Next() {
		var feed entity.Feed
		rows.Scan(&feed.FeedId, &feed.Title, &feed.Content)
		feeds = append(feeds, feed)
	}
	return feeds, nil
}

func (r *FeedRepository) UpdateFeed(newFeed *entity.Feed) error {
	_, err := r.db.Exec("update feed set title = ?, content = ? where id = ?", newFeed.Title, newFeed.Content, newFeed.FeedId)
	if err != nil {
		fmt.Println(err)
		return err
	}
	return nil
}

func (r *FeedRepository) DeleteFeed(id int) error {
	_, err := r.db.Exec("delete from feed where id = ?", id)
	if err != nil {
		return err
	}
	return nil
}
