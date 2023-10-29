import 'package:client/core/network/interface/network.dart';
import 'package:client/data/data_source/comment/remote/comment_endpoint.dart';
import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/data/dto/response/comment/get_all_comments_response_dto.dart';
import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:network_module/network_module.dart';

class RemoteCommentDataSource {
  final Networking _networking;

  RemoteCommentDataSource({required Networking networking})
      : _networking = networking;

  Future<Result<void, Exception>> createComment(
      {required CreateCommentRequestDTO createCommentRequestDTO}) async {
    return await _networking.noResponseRequest(
        endpoint: CommentEndpoint.createComment(
            createCommentRequestDTO: createCommentRequestDTO));
  }

  Future<Result<List<CommentEntity>, Exception>> getAllComments(
      {required int feedId}) async {
    final res = await _networking
        .request<GetAllCommentsResponseDTO, List<GetAllCommentsResponseDTO>>(
            endpoint: CommentEndpoint.getAllComments(feedId: feedId),
            responseType: GetAllCommentsResponseDTO());
    return switch (res) {
      Success(value: final value) =>
        Success(value: value.map((e) => e.toEntity()).toList()),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
