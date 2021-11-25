import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Color(0xff3AAFFC),
              child: Center(child: Text('제목칸'))),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Image.asset('assets/imgs/a.png'))),
          Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Center(child: Text('태그칸'))),
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Center(child: Text('설명 칸'))),
          Container(
              height: 25,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Center(child: Text('게시기간 칸'))),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.pink,
              child: Center(child: Text('공감 칸'))),
          Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.tealAccent,
              child: Center(child: Text('댓글칸'))),
        ],
      ),
    );
  }
}
