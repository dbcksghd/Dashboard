import 'dart:convert';

import 'package:client/Model/post_list.dart';
import 'package:http/http.dart' as http;
import 'package:client/Model/post.dart';

class PostDataSource {
  final String postUrl = 'http://localhost:8080/post';

  Future<void> createPost(String title, String content) async {
    final response = await http.post(
      Uri.parse(postUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'content': content}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }

  Future<PostList> _readPost() async {
    final response = await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      return PostList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("게시글 불러오기 실패");
    }
  }

  Future<List<Post>> readPost() async =>
      _readPost().then((value) => value.post!);

  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse("$postUrl?id=$id"));
    if (response.statusCode == 500) throw Exception("게시글 삭제 실패");
  }
}
