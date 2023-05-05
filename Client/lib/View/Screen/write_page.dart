import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatelessWidget {
  WriteScreen({Key? key}) : super(key: key);
  late PostViewModel viewModel;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<PostViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.createPost(
                titleController.text, contentController.text),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: contentController,
          ),
        ],
      ),
    );
  }
}
