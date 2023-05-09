import 'dart:convert';
import 'package:client/Model/feed.dart';
import 'package:http/http.dart' as http;
import 'package:client/Model/feed_list.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FeedDataSource {
  final String postUrl = 'http://localhost:8080/feed';
  var storage = const FlutterSecureStorage();

  Future<void> createFeed(String title, content) async {
    dynamic token = await storage.read(key: 'accessToken');
    final response = await http.post(
      Uri.parse(postUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'title': title, 'content': content}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 동록 실패");
    }
  }

  Future<FeedList> _readFeed() async {
    dynamic token = await storage.read(key: 'accessToken');
    final response = await http.get(
      Uri.parse(postUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
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
    dynamic token = await storage.read(key: 'accessToken');
    final response = await http.patch(
      Uri.parse(postUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'id': id, 'title': title, 'content': content}),
    );
    if (response.statusCode == 500) {
      throw Exception("게시글 수정 실패");
    }
  }

  Future<void> deleteFeed(int id) async {
    dynamic token = await storage.read(key: 'accessToken');
    final response = await http.delete(
      Uri.parse("$postUrl?id=$id"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 500) throw Exception("게시글 삭제 실패");
  }
}
