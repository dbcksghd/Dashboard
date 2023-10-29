import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:network_module/network_module.dart';

abstract interface class CommentRepository {
  Future<Result<void, Exception>> createComment(
      {required CreateCommentInRequestDTO createCommentInRequestDTO});

  Future<Result<List<CommentEntity>, Exception>> getAllComments(
      {required int feedId});
}
