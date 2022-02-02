import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/screens/pages/subpages/feedsub/commentbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

final formKey = GlobalKey<FormState>();
final TextEditingController commentController = TextEditingController();
String resultURL = '';
String resultName = '';
final FirebaseAuth auth = FirebaseAuth.instance;
User? _user;
AppData appdata = Get.find();

void initState() {
  _prepareService();
  resultURL = appdata.myInfo.image;
  resultName = appdata.myInfo.name;
}

void _prepareService() async {
  _user = auth.currentUser;
}

_profileImageOn() {
  return resultURL == ''
      ? Container(
          width: 70,
          height: 70,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              backgroundImage: AssetImage('assets/imgs/basic.png')))
      : Container(
          width: 70,
          height: 70,
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              backgroundImage: NetworkImage(resultURL)));
}

List filedata = [];

class _CommentsState extends State<Comments> {
  @override
  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(appdata.myInfo.image)),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
            ),
          )
      ],
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
            sendButton: () {
              if (formKey.currentState!.validate()) {
                print(commentController.text);
                setState(() {
                  var value = {
                    'name': appdata.myInfo.name,
                    'pic': appdata.myInfo.image,
                    'message': commentController.text
                  };
                  filedata.insert(0, value);
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
            textColor: Colors.black),
      ),
    );
  }
}
