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
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
            Flexible(
              flex: 17,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1),
                ),
                child: ListView(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  children: [
                    Text(
                      content,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, child: Container()),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(width: 1),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("댓글 ${viewModel.commentList.length}개"),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025),
                      viewModel.commentList.isNotEmpty
                          ? Text(
                              viewModel.commentList[0].comment.toString(),
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                              ),
                            )
                          : const Text('댓글 쓰러가기'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
