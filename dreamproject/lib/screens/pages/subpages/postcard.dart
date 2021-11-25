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
          //제목칸
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      //프로필 사진받아오기
                      backgroundImage: NetworkImage(
                          'https://www.woolha.com/media/2020/03/eevee.png'),
                    ),
                    SizedBox(width: 5),
                    //프로필 사진,이름 받아오기
                    Text(
                      '김윈터',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Text('1시간전'),
                //시간 받아오기
              ],
            ),
          ),
          Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Image.asset('assets/imgs/winter.jpg'))),
          Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Row(children: [
                Container(
                    width: 70,
                    height: 25,
                    margin: EdgeInsets.only(left: 50),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      '윈터',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )),
              ])),
          Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Center(child: Text('설명 칸'))),
          Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Center(child: Text('게시기간 칸'))),
          Container(
              height: 40,
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
