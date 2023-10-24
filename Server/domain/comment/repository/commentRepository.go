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
	_, err := r.db.Exec("insert into comment(postId, comment, writeTime) values (?, ?, ?)", comment.FeedId, comment.Comment, comment.WriteTime)
	if err != nil {
		return err
	}
	return nil
}

func (r *CommentRepository) FindAllCommentsInFeed(postId int) (comments []entity.Comment, err error) {
	rows, err := r.db.Query("select * from comment where postId = ?", postId)
	if err != nil {
		return nil, err
	}
	for rows.Next() {
		var comment entity.Comment
		rows.Scan(&comment.Id, &comment.FeedId, &comment.Comment, &comment.WriteTime)
		comments = append(comments, comment)
	}
	return comments, nil
}
