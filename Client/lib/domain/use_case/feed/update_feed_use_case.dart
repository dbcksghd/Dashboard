import 'package:client/data/dto/request/feed/update_feed_request_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class UpdateFeedUseCase {
  final FeedRepository _feedRepository;

  UpdateFeedUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;

  Future<Result<List<FeedEntity>, Exception>> execute(
      {required UpdateFeedRequestDTO updateFeedRequestDTO}) async {
    final res = await _feedRepository.updateFeed(
        updateFeedRequestDTO: updateFeedRequestDTO);
    return switch (res) {
      Success() => await _feedRepository.getAllFeeds(),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
