import 'package:client/DataSource/data_source.dart';
import 'package:client/Model/post.dart';

class PostRepository {
  final PostDataSource _dataSource = PostDataSource();

  Future<void> createPost(Post post) async => _dataSource.createPost(post);

  Future<List<Post>> readPost() async => _dataSource.readPost();

  Future<void> deletePost(Post post) async => _dataSource.deletePost(post);
}
