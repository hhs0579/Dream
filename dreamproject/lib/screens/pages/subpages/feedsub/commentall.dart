import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('댓글'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
    );
  }
}
