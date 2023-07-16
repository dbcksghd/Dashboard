package repository

import (
	"Server/domain/comment/entity"
	"database/sql"
)

type CommentRepository struct {
	db *sql.DB
}

func NewCommentRepository(db *sql.DB) *CommentRepository {
	return &CommentRepository{
		db: db,
	}
}

func (r *CommentRepository) CreateComment(comment *entity.Comment) error {
	result := r.db.Table("comment").Create(comment)
	if result.Error != nil {
		return result.Error
	}
	return nil
}

func (r *CommentRepository) FindAllCommentsInFeed(postId int) (*[]entity.Comment, error) {
	res := []entity.Comment{}
	result := r.db.Table("comment").Find(&res, "postId = ?", postId)
	if result.Error != nil {
		return &res, result.Error
	}
	return &res, nil
}
