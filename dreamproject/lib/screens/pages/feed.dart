import 'package:flutter/material.dart';
import 'package:simple_drawer/simple_drawer.dart';

class Feed extends StatelessWidget {
  const Feed({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:Text(
            'FEED',
            style:TextStyle(color:Colors.black),
          ),
          centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading:IconButton(
          icon:Icon(Icons.receipt_long,color:Colors.blue[300]),
          onPressed: (){
          },
        ),
        actions:<Widget> [
          IconButton(
            icon:Icon(Icons.more_vert,color:Colors.blue[300]),
            onPressed: ()=> Scaffold.of(context).openDrawer( 

            )
          )
        ],
      ),
    );
  }
}