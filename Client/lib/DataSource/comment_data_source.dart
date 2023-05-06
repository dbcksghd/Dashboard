import 'dart:convert';
import 'package:client/Model/comment.dart';
import 'package:client/Model/comment_list.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  final String commentUrl = 'http://localhost:8080/comment';

  Future<void> createComment(int id, String comment) async {
    var writeTime = DateTime.now();
    final response = await http.post(
      Uri.parse(commentUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'writeTime': writeTime, 'comment': comment}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }

  Future<CommentList> _readComments(int id) async {
    final response = await http.get(Uri.parse("$commentUrl?id=$id"));
    if (response.statusCode == 200) {
      return CommentList.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 204) {
      return CommentList.fromJson(jsonDecode("[]"));
    } else {
      throw Exception("게시글 불러오기 실패");
    }
  }

  Future<List<Comment>> readComments(int id) async =>
      _readComments(id).then((value) => value.comments!);
}
