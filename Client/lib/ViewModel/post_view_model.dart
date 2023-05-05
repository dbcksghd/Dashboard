import 'package:client/Model/post.dart';
import 'package:client/Repository/post_repository.dart';
import 'package:flutter/material.dart';

class PostViewModel with ChangeNotifier {
  late final PostRepository _repository;

  List<Post> _postList = List.empty(growable: true);
}
