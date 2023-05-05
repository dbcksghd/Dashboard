import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostPage extends StatelessWidget {
  PostPage({Key? key}) : super(key: key);
  late PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<PostViewModel>(context);
    return Scaffold();
  }
}
