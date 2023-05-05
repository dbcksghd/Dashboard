import 'package:client/Model/post.dart';
import 'package:client/Repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostViewModel with ChangeNotifier {
  late final PostRepository _repository;

  List<Post> _postList = List.empty(growable: true);

  PostViewModel() {
    _repository = PostRepository();
    _readPost();
  }

  Future _readPost() async {
    _postList = await _repository.readPost();
    notifyListeners();
  }
}
