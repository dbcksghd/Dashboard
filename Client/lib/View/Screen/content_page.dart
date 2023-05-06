import 'package:client/ViewModel/comment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key, required this.content}) : super(key: key);
  String content;
  late CommentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<CommentViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          children: [
            Flexible(
              flex: 13,
              child: ListView(
                children: [
                  Text(
                    content,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                child: Text(viewModel.postList[0].comment.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
