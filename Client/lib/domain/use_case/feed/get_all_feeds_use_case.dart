import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class GetAllFeedsUseCase {
  final FeedRepository _feedRepository;

  GetAllFeedsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;

  Future<Result<List<FeedEntity>, Exception>> execute() async =>
      await _feedRepository.getAllFeeds();
}
