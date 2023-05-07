import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WritePage extends StatefulWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  late PostViewModel viewModel;

  late TextEditingController titleController, contentController;
  late FocusNode focusNode;
  final titleFormKey = GlobalKey<FormState>();
  final contentFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    titleController.dispose();
    contentController.dispose();
  }

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
              if (titleFormKey.currentState!.validate() &&
                  contentFormKey.currentState!.validate()) {
                viewModel.createPost(
                    titleController.text, contentController.text);
                Navigator.of(context).pop();
              }
            },
            child: const Text("완료", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                child: Form(
                  key: titleFormKey,
                  child: TextFormField(
                    validator: (value) => value!.isEmpty ? '제목을 입력해주세요.' : null,
                    maxLines: 1,
                    maxLength: 20,
                    cursorColor: Colors.black,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                    keyboardType: TextInputType.text,
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: "제목을 입력해주세요",
                      border: InputBorder.none,
                      counterText: '',
                    ),
                    onFieldSubmitted: (value) => focusNode.requestFocus(),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(width: 1, color: Colors.black12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04),
                  child: Form(
                    key: contentFormKey,
                    child: TextFormField(
                      expands: true,
                      validator: (value) =>
                          value!.isEmpty ? '게시글을 입력해주세요.' : null,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          height: 1.2,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                      focusNode: focusNode,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: contentController,
                      decoration: const InputDecoration(
                        hintText: "내용을 입력해주세요",
                        border: InputBorder.none,
                      ),
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
