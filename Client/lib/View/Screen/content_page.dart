import 'package:flutter/material.dart';

class ContentPage extends StatelessWidget {
  ContentPage({Key? key, required this.content}) : super(key: key);
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Text(
          content,
          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
        ),
      ),
    );
  }
}
