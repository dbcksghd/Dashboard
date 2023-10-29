import 'package:client/data/dto/request/feed/create_feed_request_dto.dart';
import 'package:client/data/dto/request/feed/update_feed_request_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:network_module/network_module.dart';

abstract interface class FeedRepository {
  Future<Result<List<FeedEntity>, Exception>> getAllFeeds();

  Future<Result<void, Exception>> createFeed(
      {required CreateFeedRequestDTO createFeedRequestDTO});

  Future<Result<void, Exception>> updateFeed(
      {required UpdateFeedRequestDTO updateFeedRequestDTO});

  Future<Result<void, Exception>> deleteFeed({required int id});
}
