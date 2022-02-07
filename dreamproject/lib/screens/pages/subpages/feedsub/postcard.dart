import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/model/comment_item.dart';
import 'package:dreamproject/model/postitem.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/comment.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/commentall.dart';
import 'package:dreamproject/screens/starts/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCard extends StatefulWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

List<String> bb = [];
String profileURL = '';

final FirebaseAuth auth = FirebaseAuth.instance;
// Stream UserColectionStream =
//     FirebaseFirestore.instance.collection('users').snapshots();
// Stream UserdocumentStream =
//     FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
// Stream PostColectionStream =
//     FirebaseFirestore.instance.collection('post').snapshots();
// Stream PostdocumentStream =
//     FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
// final StreamController<bool> streamController = StreamController<bool>();
// // Future<String> data2() async {
// //   var data1 =
// //       (await FirebaseFirestore.instance.collection('user').doc(uid).get())
// //           .data[]
// //           .toString();
// //   return data1;
// // }
// final Stream<QuerySnapshot> _usersStream =
//     FirebaseFirestore.instance.collection('post').snapshots();
bool aa = false;

var commentkey = '';

List a = [];
_getCommentmodel() async {
  List<dynamic> commentList = appdata.postItem.commentList;

  List<dynamic> resultcommentlist = [];
  if (commentList.isEmpty) {
    print(commentList);
    return null;
  } else {
    for (var i = 0; i < commentList.length; i++) {
      var q = commentList[i];
      QuerySnapshot querySnapshot = (await FirebaseFirestore.instance
          .collection('comment')
          .doc(q)
          .get()) as QuerySnapshot<Object?>;
      if (querySnapshot.docs.isNotEmpty) {
        CommentItem commentItem = CommentItem.fromJson(
            querySnapshot.docs.first.data() as Map<String, dynamic>);
        resultcommentlist.add(commentItem);
      }
    }
    return resultcommentlist;
  }
}

mycommentListOff() {
  Container(
    child: Text('dd'),
  );
}

mycommentListOn(CommentItem commentItem) {
  Container(
    margin: EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 50.0,
              width: 50.0,
              decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: new BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(commentItem.profile)),
            ),
            Container(
              child: Text(commentItem.name),
            ),
            Container(
              child: Center(
                child: Text(commentItem.select[0],
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              width: 50,
              height: 20,
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color(0xff3AAFFC),
                  borderRadius: BorderRadius.circular(5)),
            )
          ],
        ),
        Container(
          child: Text(commentItem.comment),
        ),
      ],
    ),
  );
}

class _PostCardState extends State<PostCard> {
  final Stream<QuerySnapshot> post =
      FirebaseFirestore.instance.collection('post').snapshots();
  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: post,
      builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
      ) {
        if (snapshot.hasError) {
          return Text('오류 발생');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('로딩중');
        }
        List<PostItem> postItems = [];
        for (var value in snapshot.data!.docs) {
          PostItem postItem =
              PostItem.fromJson(value.data() as Map<String, dynamic>);
          postItems.add(postItem);
        }
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: postItems.length,
            itemBuilder: (context, index) {
              PostItem postItem = postItems.elementAt(index);
              return Column(children: [
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                            backgroundImage: NetworkImage(postItem.profile),
                          ),
                          SizedBox(width: 5),
                          //프로필 사진,이름 받아오기
                          Text(
                            postItem.name,
                            style: TextStyle(fontSize: 15),
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
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: postItem.image.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(postItem.image.elementAt(index),
                              fit: BoxFit.cover);
                        })),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: postItem.select.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Center(
                                child: Text(postItem.select.elementAt(index),
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                              width: 60,
                              height: 20,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xff3AAFFC),
                                  borderRadius: BorderRadius.circular(5)),
                            );
                          }),
                    ])),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //작성하기 글 가져오기
                      Text(postItem.post),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 40,
                              height: 15,
                              margin: EdgeInsets.only(bottom: 3),
                              child: TextButton(
                                  onPressed: () {
                                    //게시글 전체 보기 글을 늘리기
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    '더보기..',
                                    style: TextStyle(fontSize: 12),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    height: 35,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(children: [
                      Text('게시기간 : ${postItem.now} ~ ${postItem.future}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ])),
                Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(children: [
                      //공감 아이콘
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xff3AAFFC),
                        ),
                        onPressed: () {
                          final User? user = auth.currentUser;
                          final uid = user?.uid;

                          setState(() {
                            if (postItem.like.contains(appdata.myInfo.uid)) {
                              postItem.likeNum -= 1;
                              postItem.like.remove(appdata.myInfo.uid);
                              appdata.myInfo.myempathyposts.remove(key);

                              Icon(
                                Icons.favorite_border,
                                color: Color(0xff3AAFFC),
                              );
                            } else {
                              Icon(Icons.favorite, color: Color(0xff3AAFFC));
                              postItem.likeNum += 1;
                              postItem.like.add(appdata.myInfo.uid);
                              appdata.myInfo.myempathyposts.add(key);
                            }
                          });
                        },
                      ),
                      //공감 숫자
                      Text('${appdata.postItem.likeNum}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff3AAFFC))),
                      //댓글 아이콘
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.comment,
                            color: Color(0xff3AAFFC),
                          ),
                        ),
                      ),
                      //댓글 숫자

                      Text('${appdata.postItem.commentNum}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xff3AAFFC))),
                      Container(
                        padding: EdgeInsets.only(left: 80),
                        child: Row(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xff3AAFFC),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('공감하기',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color(0xff3AAFFC))),
                            )
                          ],
                        ),
                      ),
                    ])),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => Comments(), arguments: postItem.key);
                            },
                            child: Text('댓글 모두보기'),
                          )
                        ]),
                        Column(children: [
                          FutureBuilder<dynamic>(
                              future: _getCommentmodel(),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(child: Text('오류가 발생했습니다.'));
                                } else if (snapshot.data == null) {
                                  return Container();
                                } else {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(left: 10),
                                    height: 200,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 2,
                                        itemBuilder: (context, index) {
                                          List<dynamic> commentlist =
                                              snapshot.data!;
                                          return commentlist[index] == null
                                              ? mycommentListOff()
                                              : mycommentListOn(
                                                  commentlist[index]);
                                        }),
                                  );
                                }
                              }),
                        ])
                      ],
                    )),
              ]);
            });

        // return ListView.builder(
        //     scrollDirection: Axis.vertical,
        //     shrinkWrap: true,
        //     itemCount: data.size,
        //     itemBuilder: (context, index) {
        //       return Text('${data.docs[index]['post']}');
        //     });
      },
    ));
  }
}
