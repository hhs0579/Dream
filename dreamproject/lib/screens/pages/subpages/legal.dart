import 'package:flutter/material.dart';

class Legal extends StatelessWidget {
  const Legal({Key? key}) : super(key: key);
  static String tag = 'legal';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('드림파트너'),
      ),
    );
  }
}
