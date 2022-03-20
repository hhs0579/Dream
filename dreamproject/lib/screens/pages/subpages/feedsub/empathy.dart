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

List like = Get.arguments;
final Stream<QuerySnapshot> post =
    FirebaseFirestore.instance.collection('post').snapshots();

var userList = [];
var username = '';
var userimg = '';
List<dynamic> resultlist = [];
String useruid = '';
_profileImage(image) {
  return image == ''
      ? CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          backgroundImage: AssetImage('assets/imgs/basic.png'))
      : CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
          backgroundImage: NetworkImage(image));
}

_getLikemodel(List<dynamic> like) async {
  List<dynamic> resultLikeList = [];
  if (like.isEmpty) {
    return null;
  } else {
    for (var i = 0; i < like.length; i++) {
      MyInfo resultLikeItem;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(like[i])
          .get()
          .then((snapshot) => {
                resultLikeItem =
                    MyInfo.fromJson(snapshot.data() as Map<String, dynamic>),
                resultLikeList.add(resultLikeItem)
              });
    }
    return resultLikeList;
  }
}

myLikeListOn(MyInfo myinfo) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 20),
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
                  radius: 50, backgroundImage: NetworkImage(myinfo.image)),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            children: [
              Text(
                myinfo.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _empathyState extends State<empathy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '공감하기',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Loading");
                }
                List<MyInfo> usermodels = [];
                return Container(
                    child: (FutureBuilder<dynamic>(
                        future: _getLikemodel(like),
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
                                  itemCount: like.length,
                                  itemBuilder: (context, index) {
                                    List<dynamic> Likelist = snapshot.data;
                                    return Likelist == []
                                        ? myLikeListOff()
                                        : myLikeListOn(Likelist[index]);
                                  }),
                            );
                          }
                        })));
              })),
    );
  }

  myLikeListOff() {
    return Container(
      child: Text('댓글이 없습니다'),
    );
  }

  // usermodel(List<dynamic> like) async {
  //   List<dynamic> resultlikelist = [];
  //   if (like.isEmpty) {
  //     print(like);
  //     return null;
  //   } else {
  //     for (var i = 0; i < like.length; i++) {
  //       MyInfo resultlikeItem;
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(like[i])
  //           .get()
  //           .then((snapshot) => {
  //                 resultlikeItem =
  //                     MyInfo.fromJson(snapshot.data() as Map<String, dynamic>),
  //                 resultlikelist.add(resultlikeItem)
  //               });
  //     }
  //     return resultlikelist;
  //   }
  // }

  // mylikeListOff() {
  //   return Container();
  // }

  // mylikeListOn(MyInfo ilike) {
  //   return Container(
  //     margin: EdgeInsets.only(left: 10),
  //     child: Row(
  //       children: [
  //         Column(
  //           children: [
  //             Container(
  //               height: 40.0,
  //               width: 40.0,
  //               decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.all(Radius.circular(50))),
  //               child: CircleAvatar(
  //                   radius: 50, backgroundImage: NetworkImage(ilike.image)),
  //             ),
  //           ],
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(left: 10),
  //           child: Column(
  //             children: [
  //               Text(
  //                 ilike.name,
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
//   }
// }
}
