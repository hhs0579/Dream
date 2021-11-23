import 'package:flutter/material.dart';

class CurrentPage extends StatelessWidget {
  const CurrentPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
            '현황',
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
            onPressed: (){

            },
          )
        ],
      ),
    );
  }
}