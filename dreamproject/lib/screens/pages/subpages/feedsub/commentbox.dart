import 'package:cloud_firestore/cloud_firestore.dart';
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
  late Widget sendWidgets;
  late String errorText;
  late Color backgroundColor;
  late Color textColor;
  CommentBox(
      {required this.child,
      this.sendButton,
      this.formKey,
      this.commentController,
      required this.Image,
      required this.errorText,
      required this.labelText,
      required this.sendWidgets,
      required this.backgroundColor,
      required this.textColor});
  AppData appdata = Get.find();
  String resultURL = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? _user;
  final Stream<QuerySnapshot> post =
      FirebaseFirestore.instance.collection('post').snapshots();
  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('users').snapshots();
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
              backgroundImage: NetworkImage(Image),
            ),
          ),
          title: Form(
              key: formKey,
              child: TextFormField(
                maxLines: 4,
                minLines: 1,
                cursorColor: textColor,
                style: TextStyle(color: textColor),
                controller: commentController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  ),
                  labelText: labelText,
                  focusColor: textColor,
                  fillColor: textColor,
                  labelStyle: TextStyle(color: textColor),
                ),
                validator: (value) => value!.isEmpty ? errorText : null,
              )),
          trailing: OutlinedButton(
            onPressed: sendButton,
            child: sendWidgets,
          ),
        )
      ],
    );
  }
}
