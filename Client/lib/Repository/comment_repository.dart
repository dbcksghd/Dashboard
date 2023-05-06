import 'package:client/Model/comment.dart';
import 'package:client/DataSource/comment_data_source.dart';

class CommentRepository {
  final CommentDataSource _dataSource = CommentDataSource();

  Future<void> createComment(int id, String comment) async =>
      _dataSource.createComment(id, comment);

  Future<List<Comment>> readPost(int id) async => _dataSource.readComments(id);
}
