import 'package:flutter/material.dart';
import 'package:simple_drawer/simple_drawer.dart';

class Feed extends StatefulWidget {
  Feed({Key? key}) : super(key: key);
  @override
  State<Feed> createState() => _FeedState();
}
class _FeedState extends State<Feed> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width / 2,
         child: Drawer(),
      ),
      appBar: AppBar(
        title: Text(
          'FEED',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.receipt_long, color: Colors.blue[300]),
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.blue[300]),
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(
              )),
        ],
      ),
    );
  }
}
