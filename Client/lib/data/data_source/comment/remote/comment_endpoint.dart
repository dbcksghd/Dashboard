import 'package:client/core/network/interface/endpoint/dasboard_rest_api_domain.dart';
import 'package:client/core/network/interface/endpoint/dashboard_endpoint.dart';
import 'package:client/core/network/interface/interceptor/jwt/jwt_token_type.dart';
import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:network_module/network_module.dart';

sealed class CommentEndpoint extends DashboardEndpoint {
  CommentEndpoint();

  factory CommentEndpoint.createComment({
    required CreateCommentInRequestDTO createCommentInRequestDTO,
  }) = CreateComment;

  factory CommentEndpoint.getAllComments({
    required int feedId,
  }) = GetAllComments;

  @override
  BaseRequestDTO? get body => switch (this) {
        CreateComment(
          createCommentInRequestDTO: final createCommentInRequestDTO
        ) =>
          createCommentInRequestDTO,
        GetAllComments() => null,
      };

  @override
  Map<int, Error> get errorMap => {};

  @override
  DashboardRestAPIDomain get domain => DashboardRestAPIDomain.comment;

  @override
  HTTPMethod get httpMethod => switch (this) {
        CreateComment() => HTTPMethod.post,
        GetAllComments() => HTTPMethod.get,
      };

  @override
  JwtTokenType get jwtTokenType => switch (this) {
        CreateComment() => JwtTokenType.none,
        GetAllComments() => JwtTokenType.none,
      };

  @override
  String get path => "/comment";

  @override
  Map<String, dynamic>? get queryParam => switch (this) {
        CreateComment() => null,
        GetAllComments(feedId: final feedId) => {'feedId': feedId},
      };
}

final class CreateComment extends CommentEndpoint {
  final CreateCommentInRequestDTO createCommentInRequestDTO;

  CreateComment({required this.createCommentInRequestDTO});
}

final class GetAllComments extends CommentEndpoint {
  final int feedId;

  GetAllComments({required this.feedId});
}