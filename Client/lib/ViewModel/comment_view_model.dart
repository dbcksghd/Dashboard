import 'package:client/Model/comment.dart';
import 'package:client/Repository/comment_repository.dart';
import 'package:flutter/material.dart';

class CommentViewModel with ChangeNotifier {
  late final CommentRepository _repository;

  List<Comment> _commentList = List.empty(growable: true);
  bool isCommentWidgetClicked = false;

  List<Comment> get commentList => _commentList;

  CommentViewModel() {
    _repository = CommentRepository();
  }

  void click() {
    isCommentWidgetClicked = !isCommentWidgetClicked ? true : false;
    notifyListeners();
  }

  void recovery() {
    isCommentWidgetClicked = false;
    notifyListeners();
  }

  Future<void> createPost(int id, String comment) async {
    await _repository.createComment(id, comment);
    readComments(id);
  }

  Future<void> readComments(int id) async {
    _commentList = await _repository.readPost(id);
    notifyListeners();
  }
}
