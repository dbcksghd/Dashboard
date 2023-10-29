import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:client/domain/repository/comment_repository.dart';
import 'package:network_module/network_module.dart';

class CreateCommentUseCase {
  final CommentRepository _commentRepository;

  CreateCommentUseCase({required CommentRepository commentRepository})
      : _commentRepository = commentRepository;

  Future<Result<List<CommentEntity>, Exception>> execute(
      {required CreateCommentRequestDTO createCommentRequestDTO}) async {
    final res = await _commentRepository.createComment(
        createCommentRequestDTO: createCommentRequestDTO);
    return switch (res) {
      Success() => await _commentRepository.getAllComments(
          feedId: createCommentRequestDTO.feedId),
      Failure(exception: final e) => Failure(exception: e),
    };
  }
}
