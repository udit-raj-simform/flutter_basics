import 'package:flutter/material.dart';

class MyStoriesTab extends StatelessWidget {
  const MyStoriesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
          tag: "myWidget",
          child: Container(
            child: Text("My Widget"),
          )),
    );
  }
}
