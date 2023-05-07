import 'package:client/Model/comment.dart';
import 'package:client/Repository/comment_repository.dart';
import 'package:flutter/material.dart';

class CommentViewModel with ChangeNotifier {
  late final CommentRepository _repository;

  List<Comment> _commentList = List.empty(growable: true);
  bool isCommentWidgetClicked = false;
  bool isTextControllerEmpty = true;

  List<Comment> get commentList => _commentList;

  CommentViewModel() {
    _repository = CommentRepository();
  }

  void click() {
    isCommentWidgetClicked = !isCommentWidgetClicked ? true : false;
    notifyListeners();
  }

  void textFieldHaveText() {
    isTextControllerEmpty = false;
    notifyListeners();
  }

  void textFieldClear() {
    isTextControllerEmpty = true;
    notifyListeners();
  }

  void recovery() {
    isCommentWidgetClicked = false;
    notifyListeners();
  }

  Future<void> createComment(int postId, String comment) async {
    await _repository.createComment(postId, comment);
    readComments(postId);
  }

  Future<void> readComments(int postId) async {
    _commentList = await _repository.readPost(postId);
    notifyListeners();
  }
}
