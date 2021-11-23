
import 'package:dreamproject/states/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:extended_image/extended_image.dart';

class Feed extends StatefulWidget {
  static String tag = 'Feed';
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _Feed();
}

class _Feed extends State<Feed> {
  int _bottomSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:IndexedStack(
        index:_bottomSelectedIndex,
        children: [Container(color:Colors.accents[7]),Container(color:Colors.accents[7]),Container(color:Colors.accents[9]),Container(color:Colors.accents[3]),Container(color:Colors.accents[1])],
      ),
      appBar: AppBar(
        
        title:
            Text('FEED', style: Theme.of(context).appBarTheme.titleTextStyle),
        actions: [
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.nosign)),
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.search)),
          IconButton(
              onPressed: () {
                context.read<UserProvider>().setUserAuth(false);
              },
              icon: Icon(CupertinoIcons.text_justify)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        currentIndex: _bottomSelectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex==0?('assets/imgs/post2.png'):('assets/imgs/post.png')),color:Colors.blue[300],size:20), label: '피드'),
              BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex==1?('assets/imgs/increase.png'):('assets/imgs/increase2.png')),color:Colors.blue[300],size:20), label: '현황'),
              BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex==2?('assets/imgs/cloudd.png'):('assets/imgs/cloud2.png')),color:Colors.blue[300],size:50), label: '후원하기'),
              BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex==3?('assets/imgs/like.png'):('assets/imgs/like2.png')),color:Colors.blue[300],size:20), label: '공감'),
              BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(_bottomSelectedIndex==4?('assets/imgs/user.png'):('assets/imgs/user2.png')),color:Colors.blue[300],size:20), label: '내정보'),
    
        ],
        onTap: (index) {
          setState(() {
            _bottomSelectedIndex = index;
          });
        },
      ),
    );
  }
}
