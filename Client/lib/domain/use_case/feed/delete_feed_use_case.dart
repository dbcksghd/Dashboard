import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:client/domain/repository/feed_repository.dart';
import 'package:network_module/network_module.dart';

class DeleteFeedUseCase {
  final FeedRepository _feedRepository;

  DeleteFeedUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;

  Future<Result<List<FeedEntity>, Exception>> execute({required int id}) async {
    final res = await _feedRepository.deleteFeed(id: id);
    return switch (res) {
      Success() => await _feedRepository.getAllFeeds(),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
