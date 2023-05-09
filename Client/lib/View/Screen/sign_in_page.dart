import 'package:client/View/Screen/feed_page.dart';
import 'package:client/ViewModel/feed_view_model.dart';
import 'package:client/ViewModel/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late TextEditingController idController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late SignInViewModel signInViewModel;
  late FeedViewModel feedViewModel;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    nameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    signInViewModel = Provider.of<SignInViewModel>(context);
    feedViewModel = Provider.of<FeedViewModel>(context);
    return Scaffold(
      body: Center(
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
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? '아이디를 입력해주세요.' : null,
                  cursorColor: Colors.black,
                  controller: idController,
                  style: TextStyle(
                      height: 1.2,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "아이디를 입력해주세요",
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? '비밀번호를 입력해주세요.' : null,
                  cursorColor: Colors.black,
                  controller: passwordController,
                  style: TextStyle(
                      height: 1.2,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "비밀번호를 입력해주세요",
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
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04,
                    right: MediaQuery.of(context).size.width * 0.04),
                child: TextFormField(
                  validator: (value) => value!.isEmpty ? '이름을 입력해주세요.' : null,
                  cursorColor: Colors.black,
                  controller: nameController,
                  style: TextStyle(
                      height: 1.2,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "이름를 입력해주세요",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    signInViewModel
                        .signIn(idController.text, passwordController.text)
                        .then((value) {
                      if (signInViewModel.success == true) {
                        feedViewModel.readFeed();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => FeedPage()),
                            (route) => false);
                      }
                    });
                  },
                  child: const Text("로그인"),
                ),
                const TextButton(
                  onPressed: null,
                  child: Text("회원가입"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
