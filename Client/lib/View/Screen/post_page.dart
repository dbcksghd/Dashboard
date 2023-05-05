import 'package:client/View/Screen/write_page.dart';
import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height - 200,
          child: ListView.builder(
            itemCount: viewModel.postList.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(viewModel.postList[index].title.toString()),
            ),
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
