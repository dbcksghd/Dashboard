import 'package:client/ViewModel/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/View/Widget/custom_post_widget.dart';
import 'package:client/View/Screen/write_page.dart';

class FeedPage extends StatelessWidget {
  FeedPage({Key? key}) : super(key: key);
  late FeedViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<FeedViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: viewModel.feedList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomPostWidget(
                    id: viewModel.feedList[index].id!.toInt(),
                    title: viewModel.feedList[index].title.toString(),
                    content: viewModel.feedList[index].content.toString(),
                  ),
                  const SizedBox(height: 20.0),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const WritePage())),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
