import 'dart:ui';

import 'package:flutter/material.dart';

class CustomPostWidget extends StatelessWidget {
  CustomPostWidget({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(width: 1),
      ),
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height - 600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          const IconButton(onPressed: null, icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
