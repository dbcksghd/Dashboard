import 'package:client/data/data_source/comment/remote/remote_comment_data_source.dart';
import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/domain/entity/comment/comment_entity.dart';
import 'package:client/domain/repository/comment_repository.dart';
import 'package:network_module/network_module.dart';

class CommentRepositoryImpl implements CommentRepository {
  final RemoteCommentDataSource _remoteCommentDataSource;

  CommentRepositoryImpl(
      {required RemoteCommentDataSource remoteCommentDataSource})
      : _remoteCommentDataSource = remoteCommentDataSource;

  @override
  Future<Result<List<CommentEntity>, Exception>> getAllComments(
          {required feedId}) async =>
      await _remoteCommentDataSource.getAllComments(feedId: feedId);

  @override
  Future<Result<void, Exception>> createComment(
          {required CreateCommentInRequestDTO
              createCommentInRequestDTO}) async =>
      await _remoteCommentDataSource.createComment(
          createCommentInRequestDTO: createCommentInRequestDTO);
}
