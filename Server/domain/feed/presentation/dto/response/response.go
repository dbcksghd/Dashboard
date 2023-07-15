package response

import "Server/domain/feed/entity"

type FeedResponse struct {
	Feed []entity.Feed
}
