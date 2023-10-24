import 'package:client/core/network/interface/network.dart';
import 'package:client/data/data_source/feed/remote/feed_endpoint.dart';
import 'package:client/data/dto/response/feed/get_all_feeds_response_dto.dart';
import 'package:client/domain/entity/feed/feed_entity.dart';
import 'package:network_module/network_module.dart';

class RemoteFeedDataSource {
  final Networking _networking;

  RemoteFeedDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<List<FeedEntity>, Exception>> getAllFeeds() async {
    final res = await _networking
        .request<GetAllFeedsResponseDTO, List<GetAllFeedsResponseDTO>>(
            options: FeedEndpoint.getAllFeeds(),
            responseType: GetAllFeedsResponseDTO());
    return switch (res) {
      Success(value: final value) =>
        Success(value: value.map((e) => e.toEntity()).toList()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
