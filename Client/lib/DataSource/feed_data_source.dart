import 'dart:convert';
import 'package:client/Model/feed.dart';
import 'package:http/http.dart' as http;
import 'package:client/Model/feed_list.dart';

class FeedDataSource {
  final String postUrl = 'http://192.168.56.35:8080/post';

  Future<void> createFeed(String title, content) async {
    final response = await http.post(
      Uri.parse(postUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'content': content}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }

  Future<FeedList> _readFeed() async {
    final response = await http.get(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      return FeedList.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 204) {
      return FeedList.fromJson(jsonDecode("[]"));
    } else {
      throw Exception("게시글 불러오기 실패");
    }
  }

  Future<List<Feed>> readFeed() async =>
      _readFeed().then((value) => value.feed!);

  Future<void> updateFeed(int id, String title, content) async {
    final response = await http.patch(
      Uri.parse(postUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'title': title, 'content': content}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 수정 실패");
    }
  }

  Future<void> deleteFeed(int id) async {
    final response = await http.delete(Uri.parse("$postUrl?id=$id"));
    if (response.statusCode == 500) throw Exception("게시글 삭제 실패");
  }
}
