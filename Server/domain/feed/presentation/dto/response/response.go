package response

import "Server/domain/feed/entity"

type FeedResponse struct {
	feed []*entity.Feed
}
