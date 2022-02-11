import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/model/empathy_item.dart';
import 'package:dreamproject/model/myinfo.dart';
import 'package:dreamproject/model/postitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class empathy extends StatefulWidget {
  const empathy({Key? key}) : super(key: key);

  @override
  _empathyState createState() => _empathyState();
}

var likeusers = '';

extension StringExtension on String {
  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = '분';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = '시간';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = '일';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = '주';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = '달';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = '년';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? '' : '';

    return timeAgo + '전';
  }
}

var keyv = Get.arguments;
final Stream<QuerySnapshot> post =
    FirebaseFirestore.instance.collection('post').snapshots();

class _empathyState extends State<empathy> {
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
                  itemCount: postItem?.like.length,
                  itemBuilder: (context, index) {
                    PostItem postItem = postItems.elementAt(index);
                    var video = postItem.dateutc;

                    return Column(children: [
                      FutureBuilder<dynamic>(
                          future: usermodel(postItem.like),
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
                                    itemCount: postItem.like.length,
                                    itemBuilder: (context, index) {
                                      List<dynamic> likes = snapshot.data!;
                                      return likes[index] == null
                                          ? mylikeListOff()
                                          : mylikeListOn(likes[index]);
                                    }),
                              );
                            }
                          }),
                    ]);
                  });
            }));
  }

  usermodel(List<dynamic> like) async {
    List<dynamic> resultlikelist = [];
    if (like.isEmpty) {
      print(like);
      return null;
    } else {
      for (var i = 0; i < like.length; i++) {
        MyInfo resultlikeItem;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(like[i])
            .get()
            .then((snapshot) => {
                  resultlikeItem =
                      MyInfo.fromJson(snapshot.data() as Map<String, dynamic>),
                  resultlikelist.add(resultlikeItem)
                });
      }
      return resultlikelist;
    }
  }

  mylikeListOff() {
    return Container();
  }

  mylikeListOn(MyInfo ilike) {
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
                    radius: 50, backgroundImage: NetworkImage(ilike.image)),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Text(
                  ilike.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
