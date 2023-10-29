import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/domain/repository/comment_repository.dart';
import 'package:network_module/network_module.dart';

class CreateCommentUseCase {
  final CommentRepository _commentRepository;

  CreateCommentUseCase({required CommentRepository commentRepository})
      : _commentRepository = commentRepository;

  Future<Result<void, Exception>> execute(
          {required CreateCommentInRequestDTO
              createCommentInRequestDTO}) async =>
      await _commentRepository.createComment(
          createCommentInRequestDTO: createCommentInRequestDTO);
}
