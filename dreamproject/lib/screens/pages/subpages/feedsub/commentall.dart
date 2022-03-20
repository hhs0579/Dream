import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/model/comment_item.dart';
import 'package:dreamproject/model/myinfo.dart';
import 'package:dreamproject/model/postitem.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/commentbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:random_string/random_string.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key, aa}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

List commentX = Get.arguments[0];
String postkey = Get.arguments[1];

final formKey = GlobalKey<FormState>();
FirebaseFirestore fireStore = FirebaseFirestore.instance;
final TextEditingController commentController = TextEditingController();
String resultURL = '';
String resultName = '';
List<dynamic> selected = [];
final FirebaseAuth auth = FirebaseAuth.instance;
User? _user;
var keyplus = 1;
var now = DateTime.now();
String date = DateFormat('yyyy/MM/dd - HH:mm:ss').format(now);
final isSelected = <bool>[true, false, false];

AppData appdata = Get.find();
var key = randomString(16);

void initState() {
  _prepareService();
  resultURL = appdata.myInfo.image;
  resultName = appdata.myInfo.name;
}

List<String> keys = [];

void _prepareService() async {
  _user = auth.currentUser;
}

_getCommentmodel(List<dynamic> commentList) async {
  List<dynamic> resultcommentlist = [];
  if (commentX.isEmpty) {
    return null;
  } else {
    for (var i = 0; i < commentX.length; i++) {
      CommentItem resultcommentItem;
      await FirebaseFirestore.instance
          .collection('comments')
          .doc(commentX[i])
          .get()
          .then((snapshot) => {
                resultcommentItem = CommentItem.fromJson(
                    snapshot.data() as Map<String, dynamic>),
                resultcommentlist.add(resultcommentItem)
              });
    }
    return resultcommentlist;
  }
}

mycommentListOn(CommentItem commentItem) {
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Row(
      children: [
        Column(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(commentItem.profile)),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Text(
                commentItem.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(commentItem.comment),
            ],
          ),
        ),
        Container(
          child: Center(
            child: Text(commentItem.select[0],
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          width: 50,
          height: 20,
          margin: EdgeInsets.only(bottom: 20, left: 5),
          decoration: BoxDecoration(
              color: Color(0xff3AAFFC), borderRadius: BorderRadius.circular(5)),
        )
      ],
    ),
  );
}

List filedata = [];
final Stream<QuerySnapshot> post =
    FirebaseFirestore.instance.collection('post').snapshots();

class _CommentsState extends State<Comments> {
  @override
  Widget commentChild(data) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: post,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('오류 발생');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('로딩중');
              }
              List<CommentItem> commentItems = [];
              List<PostItem> postItems = [];
              for (var value in snapshot.data!.docs) {
                PostItem postItem =
                    PostItem.fromJson(value.data() as Map<String, dynamic>);
                postItems.add(postItem);
              }

              return Container(
                  child: (FutureBuilder<dynamic>(
                      future: _getCommentmodel(commentX),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Center(child: Text('오류가 발생했습니다.'));
                        } else if (snapshot.data == null ||
                            snapshot.data == []) {
                          return Container();
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(left: 10),
                            height: 200,
                            child: ListView.builder(
                                itemCount: commentX.length,
                                itemBuilder: (context, index) {
                                  List<dynamic> commentlist = snapshot.data;
                                  return commentlist == []
                                      ? mycommentListOff()
                                      : mycommentListOn(commentlist[index]);
                                }),
                          );
                        }
                      })));
            }));
  }

  mycommentListOff() {
    return Container(
      child: Text('댓글이 없습니다'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('댓글'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: CommentBox(
          child: commentChild(filedata),
          Image: appdata.myInfo.image,
          select: selected,
          sendButton: () async {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': commentItem?.name,
                  'pic': commentItem?.profile,
                  'message': commentItem?.comment,
                  'select': commentItem?.select[0],
                };
                filedata.insert(0, value);
              });
              final User? user = auth.currentUser;
              final uid = user?.uid;

              await fireStore.collection('comments').doc(key).set({
                'timeStamp': Timestamp.now(),
                'key': key,
                'comment': commentController.text,
                'profile': appdata.myInfo.image,
                'name': appdata.myInfo.name,
                'date': date,
                'select': selected
              });
              keys.add(key);
              fireStore
                  .collection('post')
                  .doc(postkey)
                  .update({'commentList': FieldValue.arrayUnion(keys)});
              appdata.postItem.commentList.add(key);
              setState(() {
                key = randomString(16);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print('값이 없습니다');
            }
          },
          errorText: '댓글 내용이 없습니다',
          labelText: '댓글을 입력해주세요',
          sendWidgets:
              Icon(Icons.send_sharp, size: 30, color: Colors.lightBlue),
          backgroundColor: Colors.lightBlue,
          commentController: commentController,
          formKey: formKey,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
