import 'package:client/View/Screen/write_page.dart';
import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:client/View/Widget/custom_post_widget.dart';

class PostPage extends StatelessWidget {
  PostPage({Key? key}) : super(key: key);
  late PostViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            reverse: true,
            itemCount: viewModel.postList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomPostWidget(
                    title: viewModel.postList[index].title.toString(),
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
            .push(MaterialPageRoute(builder: (context) => WriteScreen())),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
