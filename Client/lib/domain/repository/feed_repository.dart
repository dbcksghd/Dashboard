import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:network_module/network_module.dart';

abstract interface class FeedRepository {
  Future<Result<List<FeedEntity>, Exception>> getAllFeeds();
}
