import 'package:client/View/Screen/content_page.dart';
import 'package:client/View/Screen/update_page.dart';
import 'package:client/ViewModel/comment_view_model.dart';
import 'package:client/ViewModel/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomPostWidget extends StatelessWidget {
  CustomPostWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.id,
  }) : super(key: key);

  final String title, content;
  final int id;
  late FeedViewModel postViewModel;
  late CommentViewModel commentViewModel;

  @override
  Widget build(BuildContext context) {
    postViewModel = Provider.of<FeedViewModel>(context);
    commentViewModel = Provider.of<CommentViewModel>(context);
    return GestureDetector(
      onTap: () {
        commentViewModel.readComments(id);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ContentPage(id: id, content: content),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.09,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UpdatePage(
                                      id: id, title: title, content: content),
                                ),
                              ),
                              child: Text(
                                "수정하기",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            TextButton(
                              onPressed: () {
                                postViewModel.deleteFeed(id);
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "삭제하기",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.more_vert)),
          ],
        ),
      ),
    );
  }
}
