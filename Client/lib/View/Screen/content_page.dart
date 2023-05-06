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
          onPressed: () {
            viewModel.recovery();
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
            Flexible(
              flex: !viewModel.isCommentWidgetClicked ? 17 : 9,
              child: GestureDetector(
                onTap: () {
                  if (viewModel.isCommentWidgetClicked == true) {
                    viewModel.click();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
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
            ),
            Flexible(flex: 1, child: Container()),
            Flexible(
              flex: !viewModel.isCommentWidgetClicked ? 4 : 12,
              child: GestureDetector(
                onTap: () => viewModel.click(),
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
                      right: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("댓글 ${viewModel.commentList.length}개"),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 0.5),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.03),
                            alignment: Alignment.centerLeft,
                            child: viewModel.isCommentWidgetClicked
                                ? TextField(
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    cursorColor: Colors.black,
                                    decoration: const InputDecoration(
                                      hintText: "댓글을 입력해주세요",
                                      border: InputBorder.none,
                                      counterText: '',
                                    ),
                                  )
                                : const Text('댓글 쓰러가기'),
                          ),
                        ),
                        if (viewModel.isCommentWidgetClicked)
                          Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.03),
                            height: MediaQuery.of(context).size.height * 0.29,
                            width: double.infinity,
                            child: ListView.builder(
                              itemCount: viewModel.commentList.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).size.height *
                                        0.02),
                                child: Text(
                                  viewModel.commentList[index].comment
                                      .toString(),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
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
