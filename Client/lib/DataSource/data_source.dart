import 'package:http/http.dart' as http;
import 'package:client/Model/post.dart';

class PostDataSource {
  final String postUrl = 'http://localhost:8080/post';

  Future<void> createPost(Post post) async {
    final response = await http.post(Uri.parse(postUrl),
        body: {"title": post.title, "content": post.content});
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }
}
