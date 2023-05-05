import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WritePage extends StatelessWidget {
  WritePage({Key? key}) : super(key: key);
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
          TextButton(
            onPressed: () {
              viewModel.createPost(
                  titleController.text, contentController.text);
              Navigator.of(context).pop();
            },
            child: const Text("완료", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03),
                child: TextField(
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  maxLines: 1,
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
                padding:
                    EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.03,
                        right: MediaQuery.of(context).size.width * 0.03),
                child: TextField(
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  maxLines: null,
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
      ),
    );
  }
}
