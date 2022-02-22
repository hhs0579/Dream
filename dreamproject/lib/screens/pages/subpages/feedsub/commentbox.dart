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
  List<dynamic> select;

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
      required this.textColor,
      required this.select});

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  AppData appdata = Get.find();

  String resultURL = '';
  final isSelected = <bool>[false, false, false];
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
        Divider(height: 2),
        Column(
          children: [
            ToggleButtons(
              color: Colors.black.withOpacity(0.6),
              selectedColor: Color(0xff3AAFFC),
              fillColor: Colors.white.withOpacity(0.3),
              splashColor: Color(0xff3AAFFC).withOpacity(0.2),
              hoverColor: Color(0xff3AAFFC).withOpacity(0.04),
              borderRadius: BorderRadius.circular(10.0),
              borderColor: Colors.black.withOpacity(0.1),
              selectedBorderColor: Color(0xff3AAFFC),
              constraints: BoxConstraints(minHeight: 36.0),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('일반댓글'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('물품기부'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('재능기부'),
                ),
              ],
              onPressed: (index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                  if (index == 0) {
                    setState(() {
                      widget.select.clear();
                      widget.select.add('일반댓글');
                    });
                  }
                  if (index == 1) {
                    setState(() {
                      widget.select.clear();
                      widget.select.add('물품기부');
                    });
                  }
                  if (index == 2) {
                    setState(() {
                      widget.select.clear();
                      widget.select.add('재능기부');
                    });
                  }
                });
              },
              isSelected: isSelected,
            ),
            ListTile(
              leading: Column(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: new BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius:
                            new BorderRadius.all(Radius.circular(50))),
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
            ),
          ],
        )
      ],
    );
  }
}
