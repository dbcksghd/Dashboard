import 'package:client/View/Screen/feed_page.dart';
import 'package:client/View/Screen/sign_in_page.dart';
import 'package:client/ViewModel/comment_view_model.dart';
import 'package:client/ViewModel/feed_view_model.dart';
import 'package:client/ViewModel/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FeedViewModel()),
        ChangeNotifierProvider(create: (context) => CommentViewModel()),
        ChangeNotifierProvider(create: (context) => SignInViewModel()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
