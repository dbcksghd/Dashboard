import 'package:flutter/material.dart';

class CustomPostWidget extends StatelessWidget {
  CustomPostWidget({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 200.0,
      child: Text(title),
    );
  }
}
