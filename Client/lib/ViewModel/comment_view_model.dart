import 'package:client/Model/comment.dart';
import 'package:client/Repository/comment_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CommentViewModel with ChangeNotifier {
  late final CommentRepository _repository;

  List<Comment> _postList = List.empty(growable: true);

  List<Comment> get postList => _postList;

  CommentViewModel() {
    _repository = CommentRepository();
  }

  Future<void> createPost(int id, String comment) async {
    await _repository.createComment(id, comment);
    readComments(id);
  }

  Future<void> readComments(int id) async {
    _postList = await _repository.readPost(id);
    notifyListeners();
  }
}
