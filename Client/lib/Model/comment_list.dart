import 'package:client/Model/comment.dart';

class CommentList {
  final List<Comment>? comments;

  CommentList({this.comments});

  factory CommentList.fromJson(List<dynamic> json) {
    List<Comment> comments = List.empty(growable: true);
    comments = json.map((i) => Comment.fromJson(i)).toList();

    return CommentList(
      comments: comments,
    );
  }
}
