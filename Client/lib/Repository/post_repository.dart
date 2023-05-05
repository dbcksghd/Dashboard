import 'package:client/DataSource/data_source.dart';
import 'package:client/Model/post.dart';

class PostRepository {
  final PostDataSource _dataSource = PostDataSource();

  Future<void> createPost(String title, content) async =>
      _dataSource.createPost(title, content);

  Future<List<Post>> readPost() async => _dataSource.readPost();

  Future<void> updatePost(int id, String title, content) async =>
      _dataSource.updatePost(id, title, content);

  Future<void> deletePost(int id) async => _dataSource.deletePost(id);
}
