import 'package:client/data/data_source/feed/remote/remote_feed_data_source.dart';
import 'package:client/data/dto/request/feed/create_feed_request_dto.dart';
import 'package:client/data/dto/request/feed/update_feed_request_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class FeedRepositoryImpl implements FeedRepository {
  final RemoteFeedDataSource _remoteFeedDataSource;

  FeedRepositoryImpl({required RemoteFeedDataSource remoteFeedDataSource})
      : _remoteFeedDataSource = remoteFeedDataSource;

  @override
  Future<Result<List<FeedEntity>, Exception>> getAllFeeds() async =>
      await _remoteFeedDataSource.getAllFeeds();

  @override
  Future<Result<void, Exception>> createFeed(
          {required CreateFeedRequestDTO createFeedRequestDTO}) async =>
      await _remoteFeedDataSource.createFeed(
          createFeedRequestDTO: createFeedRequestDTO);

  @override
  Future<Result<void, Exception>> deleteFeed({required int id}) async =>
      await _remoteFeedDataSource.deleteFeed(id: id);

  @override
  Future<Result<void, Exception>> updateFeed(
          {required UpdateFeedRequestDTO updateFeedRequestDTO}) async =>
      _remoteFeedDataSource.updateFeed(
          updateFeedRequestDTO: updateFeedRequestDTO);
}
