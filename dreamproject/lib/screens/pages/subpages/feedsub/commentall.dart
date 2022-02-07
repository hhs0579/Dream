import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/model/comment_item.dart';
import 'package:dreamproject/model/myinfo.dart';
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

var k = Get.arguments;

List<String> keys = [];

void _prepareService() async {
  _user = auth.currentUser;
}

List filedata = [];
final Stream<QuerySnapshot> comment =
    FirebaseFirestore.instance.collection('comments').snapshots();

class _CommentsState extends State<Comments> {
  @override
  Widget commentChild(data) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: comment,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('오류 발생');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('로딩중');
            }
            List<CommentItem> commentItems = [];
            for (var value in snapshot.data!.docs) {
              CommentItem commentItem =
                  CommentItem.fromJson(value.data() as Map<String, dynamic>);
              commentItems.add(commentItem);
            }

            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: commentItems.length,
                itemBuilder: (context, index) {
                  CommentItem commentItem = commentItems.elementAt(index);

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 50.0,
                              width: 50.0,
                              decoration: new BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(50))),
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(appdata.myInfo.image)),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
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
                  );
                });
          }),
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
          sendButton: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': appdata.myInfo.name,
                  'pic': appdata.myInfo.image,
                  'message': commentController.text,
                  'select': selected[0]
                };
                filedata.insert(0, value);
              });
              final User? user = auth.currentUser;
              final uid = user?.uid;

              fireStore.collection('comments').doc(key).set({
                'key': key,
                'comment': commentController.text,
                'profile': appdata.myInfo.image,
                'name': appdata.myInfo.name,
                'date': date,
                'select': selected
              });
              keys.add(key);
              fireStore.collection('post').doc(k).update({'commentList': keys});
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
