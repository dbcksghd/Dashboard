import 'package:client/Model/comment.dart';
import 'package:client/DataSource/comment_data_source.dart';

class CommentRepository {
  final CommentDataSource _dataSource = CommentDataSource();

  Future<void> createComment(int postId, String comment) async =>
      _dataSource.createComment(postId, comment);

  Future<List<Comment>> readPost(int postId) async => _dataSource.readComments(postId);
}
