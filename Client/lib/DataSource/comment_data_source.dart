import 'dart:convert';
import 'package:client/Model/comment.dart';
import 'package:client/Model/comment_list.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  final String commentUrl = 'http://192.168.56.35:8080/comment';

  Future<void> createComment(int postId, String comment) async {
    var writeTime = DateTime.now();
    final response = await http.post(
      Uri.parse(commentUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'postId': postId, 'writeTime': writeTime.toString(), 'comment': comment}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }

  Future<CommentList> _readComments(int postId) async {
    final response = await http.get(Uri.parse("$commentUrl?postId=$postId"));
    if (response.statusCode == 200) {
      return CommentList.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 204) {
      return CommentList.fromJson(jsonDecode("[]"));
    } else {
      throw Exception("게시글 불러오기 실패");
    }
  }

  Future<List<Comment>> readComments(int postId) async =>
      _readComments(postId).then((value) => value.comments!);
}
