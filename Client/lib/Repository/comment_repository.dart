import 'package:client/DataSource/comment_data_source.dart';

class CommentRepository {
  final CommentDataSource _dataSource = CommentDataSource();

  Future<void> createPost(int id, String comment) async =>
      _dataSource.createComment(id, comment);
}
