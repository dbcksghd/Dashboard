package service

import (
	"Server/domain/comment/entity"
	"Server/domain/comment/presentation/dto/request"
	"Server/domain/comment/repository"
	"github.com/labstack/echo/v4"
	"net/http"
)

type CommentService struct {
	repository repository.CommentRepository
}

func NewCommentService(repository repository.CommentRepository) *CommentService {
	return &CommentService{
		repository: repository,
	}
}

func (s *CommentService) CreateComment(req *request.CreateRequest, c echo.Context) error {
	comment := entity.Comment{PostId: req.PostId, WriteTime: req.WriteTime, Comment: req.Comment}
	if err := s.repository.CreateComment(&comment); err != nil {
		return c.JSON(http.StatusNotFound, map[string]string{"message": "댓글 생성 실패"})
	}
	return c.NoContent(201)
}

func (s *CommentService) FindAllCommentsInFeed(postId int, c echo.Context) error {
	comments, err := s.repository.FindAllCommentsInFeed(postId)
	if err != nil {
		return c.JSON(http.StatusNotFound, map[string]string{"message": "댓글 불러오기 실패"})
	}
	if len(comments) == 0 {
		return c.NoContent(204)
	}
	return c.JSON(http.StatusOK, comments)
}
