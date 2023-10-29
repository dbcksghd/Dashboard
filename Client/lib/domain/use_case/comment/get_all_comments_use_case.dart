import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:client/domain/repository/comment_repository.dart';
import 'package:network_module/network_module.dart';

class GetAllCommentsUseCase {
  final CommentRepository _commentRepository;

  GetAllCommentsUseCase({required CommentRepository commentRepository})
      : _commentRepository = commentRepository;

  Future<Result<List<CommentEntity>, Exception>> execute(
          {required int feedId}) async =>
      await _commentRepository.getAllComments(feedId: feedId);
}
