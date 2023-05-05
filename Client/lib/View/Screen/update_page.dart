import 'package:client/View/Screen/post_page.dart';
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
              viewModel.updatePost(
                  id, titleController.text, contentController.text);
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => PostPage()),
                  (route) => false);
            },
            child: const Text("수정", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 1, color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                maxLines: 1,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05),
                keyboardType: TextInputType.text,
                controller: titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 1, color: Colors.black12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: TextField(
                maxLines: null,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05),
                keyboardType: TextInputType.multiline,
                controller: contentController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
