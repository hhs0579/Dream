import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentBox extends StatefulWidget {
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

  CommentBox({
    required this.child,
    this.sendButton,
    this.formKey,
    this.commentController,
    required this.Image,
    required this.errorText,
    required this.labelText,
    required this.sendWidgets,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  AppData appdata = Get.find();
  bool commonComment = false;
  bool productComment = false;
  bool talentComment = false;
  String resultURL = '';
  final isSelected = <bool>[true, false, false];
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? _user;

  final Stream<QuerySnapshot> post =
      FirebaseFirestore.instance.collection('post').snapshots();

  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('users').snapshots();

  void initState() {
    _prepareService();
  }

  void _prepareService() async {
    _user = auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: widget.child,
        ),
        Divider(height: 1),
        ListTile(
          leading: Column(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: new BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: new BorderRadius.all(Radius.circular(50))),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(appdata.myInfo.image),
                ),
              ),
            ],
          ),
          title: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 4,
                    minLines: 1,
                    cursorColor: widget.textColor,
                    style: TextStyle(color: widget.textColor),
                    controller: widget.commentController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: widget.textColor),
                      ),
                      labelText: widget.labelText,
                      focusColor: widget.textColor,
                      fillColor: widget.textColor,
                      labelStyle: TextStyle(color: widget.textColor),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? widget.errorText : null,
                  ),
                ],
              )),
          trailing: OutlinedButton(
            onPressed: widget.sendButton,
            child: widget.sendWidgets,
          ),
        )
      ],
    );
  }
}
