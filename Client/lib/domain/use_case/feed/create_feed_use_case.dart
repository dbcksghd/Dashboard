import 'package:client/data/dto/request/feed/create_feed_request_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class CreateFeedUseCase {
  final FeedRepository _feedRepository;

  CreateFeedUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;

  Future<Result<List<FeedEntity>, Exception>> execute(
      {required CreateFeedRequestDTO createFeedRequestDTO}) async {
    final res = await _feedRepository.createFeed(
        createFeedRequestDTO: createFeedRequestDTO);
    return switch (res) {
      Success() => await _feedRepository.getAllFeeds(),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
