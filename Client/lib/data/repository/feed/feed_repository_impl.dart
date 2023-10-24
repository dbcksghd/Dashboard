import 'package:client/data/data_source/feed/remote/remote_feed_data_source.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class FeedRepositoryImpl implements FeedRepository {
  final RemoteFeedDataSource _remoteFeedDataSource;

  FeedRepositoryImpl({required RemoteFeedDataSource remoteFeedDataSource})
      : _remoteFeedDataSource = remoteFeedDataSource;

  @override
  Future<Result<List<FeedEntity>, Exception>> getAllFeeds() =>
      _remoteFeedDataSource.getAllFeeds();
}
