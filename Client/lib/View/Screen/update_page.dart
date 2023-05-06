import 'package:client/View/Screen/post_page.dart';
import 'package:client/ViewModel/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({
    Key? key,
    required this.id,
    required this.title,
    required this.content,
  }) : super(key: key);

  int id;
  String title, content;

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
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
    titleController = TextEditingController(text: widget.title);
    contentController = TextEditingController(text: widget.content);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => PostPage()),
              (route) => false),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (titleFormKey.currentState!.validate() &&
                  contentFormKey.currentState!.validate()) {
                viewModel.updatePost(
                    widget.id, titleController.text, contentController.text);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => PostPage()),
                    (route) => false);
              }
            },
            child: const Text("수정", style: TextStyle(color: Colors.black)),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.089),
            Expanded(
              child: Container(
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
                    key: contentFormKey,
                    child: TextFormField(
                      expands: true,
                      validator: (value) =>
                          value!.isEmpty ? '게시글을 입력해주세요.' : null,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          height: 1.2,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                      maxLines: null,
                      focusNode: focusNode,
                      keyboardType: TextInputType.multiline,
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
