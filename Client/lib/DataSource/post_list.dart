import 'package:client/Model/post.dart';

class PostList {
  final List<Post>? post;

  PostList({this.post});

  factory PostList.fromJson(List<dynamic> json) {
    List<Post> post = List.empty(growable: true);
    post = json.map((i) => Post.fromJson(i)).toList();

    return PostList(
      post: post,
    );
  }
}
