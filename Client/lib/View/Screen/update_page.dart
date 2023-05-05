import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatelessWidget {
  UpdatePage({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
  }) : super(key: key);

  int id;
  String title, content;
  late PostViewModel viewModel;
  late TextEditingController titleController, contentController;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<PostViewModel>(context);
    titleController = TextEditingController(text: title);
    contentController = TextEditingController(text: content);
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
          TextButton(
            onPressed: () {
              viewModel.updatePost(id, title, content);
              Navigator.of(context).pop();
            },
            child: const Text("수정", style: TextStyle(color: Colors.black)),
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
