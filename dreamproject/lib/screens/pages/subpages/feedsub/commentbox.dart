import 'package:dreamproject/data/appdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentBox extends StatelessWidget {
  late Widget child;
  dynamic formKey;
  dynamic sendButton;
  dynamic commentController;
  late String Image;
  late String labelText;
  late String sendWidgets;
  late Color backgroundColor;
  late Color textColor;
  CommentBox(
      {required this.child,
      this.sendButton,
      this.formKey,
      this.commentController,
      required this.Image,
      required this.labelText,
      required this.sendWidgets,
      required this.backgroundColor,
      required this.textColor});
  AppData appdata = Get.find();
  String resultURL = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? _user;
  void initState() {
    _prepareService();
    resultURL = appdata.myInfo.image;
  }

  void _prepareService() async {
    _user = auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        Divider(height: 1),
        ListTile(
          leading: Container(
            height: 40.0,
            width: 40.0,
            decoration: new BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: new BorderRadius.all(Radius.circular(50))),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(resultURL),
            ),
          ),
        )
      ],
    );
  }
}
