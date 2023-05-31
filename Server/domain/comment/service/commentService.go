package service

import (
	"Server/domain/comment/entity"
	"Server/domain/comment/repository"
	"errors"
)

type CommentService struct {
	repository repository.CommentRepository
}

func NewCommentService(repository repository.CommentRepository) *CommentService {
	return &CommentService{
		repository: repository,
	}
}

func (s *CommentService) CreateComment(comment *entity.Comment) error {
	if err := s.repository.CreateComment(comment); err != nil {
		return errors.New("댓글 생성 실패")
	}
	return nil
}

func (s *CommentService) FindAllFeedsInFeed(id int) (*[]entity.Comment, error) {
	comments, err := s.repository.FindAllCommentInFeed(id)
	if err != nil {
		return comments, errors.New("댓글 불러오기 실패")
	}
	return comments, nil
}
