import 'package:client/Model/comment.dart';
import 'package:client/Repository/comment_repository.dart';
import 'package:flutter/material.dart';

class CommentViewModel with ChangeNotifier {
  late final CommentRepository _repository;

  List<Comment> _postList = List.empty(growable: true);

  List<Comment> get postList => _postList;

  CommentViewModel() {
    _repository = CommentRepository();
  }

  Future<void> createPost(int id, String comment) async {
    await _repository.createComment(id, comment);
    readComments();
  }

  Future<void> readComments() async {
    _postList = await _repository.readPost();
    notifyListeners();
  }
}
