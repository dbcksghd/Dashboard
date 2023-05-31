package repository

import (
	"Server/domain/comment/entity"
	"gorm.io/gorm"
)

type CommentRepository struct {
	db *gorm.DB
}

func NewCommentRepository(db *gorm.DB) *CommentRepository {
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

func (r *CommentRepository) FindAllCommentsInFeed(id int) (*[]entity.Comment, error) {
	res := []entity.Comment{}
	result := r.db.Table("comment").Find(&res, "id = ?", id)
	if result.Error != nil {
		return &res, result.Error
	}
	return &res, nil
}
