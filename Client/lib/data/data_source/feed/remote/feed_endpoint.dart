import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:client/data/dto/request/feed/create_feed_request_dto.dart';
import 'package:client/data/dto/request/feed/update_feed_request_dto.dart';
import 'package:network_module/network_module.dart';

sealed class FeedEndpoint extends DashboardEndpoint {
  FeedEndpoint();

  factory FeedEndpoint.getAllFeeds() = GetAllFeeds;

  factory FeedEndpoint.createFeed(
      {required CreateFeedRequestDTO createFeedRequestDTO}) = CreateFeed;

  factory FeedEndpoint.updateFeed(
      {required UpdateFeedRequestDTO updateFeedRequestDTO}) = UpdateFeed;

  factory FeedEndpoint.deleteFeed({required int id}) = DeleteFeed;

  @override
  BaseRequestDTO? get body => switch (this) {
        GetAllFeeds() => null,
        CreateFeed(createFeedRequestDTO: final createFeedRequestDTO) =>
          createFeedRequestDTO,
        UpdateFeed(updateFeedRequestDTO: final updateFeedRequestDTO) =>
          updateFeedRequestDTO,
        DeleteFeed() => null,
      };

  @override
  Map<int, Error> get errorMap => {};

  @override
  DashboardRestAPIDomain get domain => DashboardRestAPIDomain.feed;

  @override
  HTTPMethod get httpMethod => switch (this) {
        GetAllFeeds() => HTTPMethod.get,
        UpdateFeed() => HTTPMethod.patch,
        DeleteFeed() => HTTPMethod.delete,
        CreateFeed() => HTTPMethod.post,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        GetAllFeeds() => JwtTokenType.none,
        CreateFeed() => JwtTokenType.none,
        UpdateFeed() => JwtTokenType.none,
        DeleteFeed() => JwtTokenType.none
      };

  @override
  String get path => "/feed";

  @override
  Map<String, String> get queryParam => switch (this) {
        DeleteFeed(id: final id) => {'id': id.toString()},
        GetAllFeeds() => {},
        UpdateFeed() => {},
        CreateFeed() => {}
      };
}

final class GetAllFeeds extends FeedEndpoint {}

final class DeleteFeed extends FeedEndpoint {
  final int id;

  DeleteFeed({required this.id});
}

final class UpdateFeed extends FeedEndpoint {
  final UpdateFeedRequestDTO updateFeedRequestDTO;

  UpdateFeed({required this.updateFeedRequestDTO});
}

final class CreateFeed extends FeedEndpoint {
  final CreateFeedRequestDTO createFeedRequestDTO;

  CreateFeed({required this.createFeedRequestDTO});
}
