import 'package:client/data/dto/request/comment/create_comment_request_dto.dart';
import 'package:client/presentation/content_page/content_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key, required this.feedId, required this.content})
      : super(key: key);
  final int feedId;
  final String content;

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  late ContentPageViewModel viewModel;
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ContentPageViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            viewModel.recovery();
            viewModel.textFieldClear();
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1),
                ),
                child: ListView(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  children: [
                    Text(
                      widget.content,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(flex: 1, child: Container()),
            Flexible(
              flex: !viewModel.isCommentWidgetClicked ? 4 : 12,
              child: GestureDetector(
                onTap: () {
                  if (!viewModel.isCommentWidgetClicked) {
                    viewModel.click();
                  }
                },
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
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("댓글 ${viewModel.commentList.length}개"),
                            IconButton(
                                onPressed: () {
                                  if (viewModel.isCommentWidgetClicked) {
                                    viewModel.click();
                                  }
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.025),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(width: 0.5),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.click();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width * 0.03),
                              alignment: Alignment.centerLeft,
                              child: viewModel.isCommentWidgetClicked
                                  ? TextField(
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04),
                                      onChanged: (value) {
                                        if (viewModel.isTextControllerEmpty) {
                                          viewModel.textFieldHaveText();
                                        } else if (value.isEmpty) {
                                          viewModel.textFieldClear();
                                        }
                                      },
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.multiline,
                                      controller: commentController,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            color:
                                                viewModel.isTextControllerEmpty
                                                    ? Colors.grey
                                                    : Colors.blueAccent,
                                            onPressed: () {
                                              if (commentController
                                                  .text.isNotEmpty) {
                                                viewModel.createComment(
                                                    createCommentRequestDTO:
                                                        CreateCommentRequestDTO(
                                                            feedId:
                                                                widget.feedId,
                                                            writeTime:
                                                                "20231029",
                                                            content:
                                                                commentController
                                                                    .text));
                                                commentController.clear();
                                                viewModel.textFieldClear();
                                              }
                                            },
                                            icon: const Icon(Icons.send)),
                                        hintText: "댓글을 입력해주세요",
                                        border: InputBorder.none,
                                        counterText: '',
                                      ),
                                    )
                                  : const Text('댓글 쓰러가기'),
                            ),
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
                                  viewModel.commentList[index].content,
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
