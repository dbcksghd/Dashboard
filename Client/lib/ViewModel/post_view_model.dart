import 'package:client/Model/post.dart';
import 'package:client/Repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostViewModel with ChangeNotifier {
  late final PostRepository _repository;

  List<Post> _postList = List.empty(growable: true);

  List<Post> get postList => _postList;

  PostViewModel() {
    _repository = PostRepository();
    readPost();
  }

  Future<void> createPost(String title, content) async {
    await _repository.createPost(title, content);
    readPost();
  }

  Future<void> readPost() async {
    _postList = await _repository.readPost();
    notifyListeners();
  }

  Future<void> updatePost(int id, String title, content) async {
    await _repository.updatePost(id, title, content);
    readPost();
  }

  Future<void> deletePost(int id) async {
    await _repository.deletePost(id);
    readPost();
  }
}
