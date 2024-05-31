import "package:flutter/material.dart";


class CommentsScreen extends StatefulWidget {
  final postId;
  const CommentsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("add post screen",style: TextStyle(color: Colors.white),),
    );
  }
}