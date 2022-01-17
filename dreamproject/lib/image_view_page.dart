import 'package:dreamproject/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/appdata.dart';

class ImageViewPage extends StatefulWidget {
  final String imageUrl;

  const ImageViewPage({Key? key, required this.imageUrl}) : super(key: key);
  @override
  _ImageViewPageState createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  AppData appData = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (AppData appData) => Loading(
        child: Scaffold(
          appBar: AppBar(),
          body: InteractiveViewer(
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                // color: Colors.amber,
                child: Center(
                  child: Image.network(widget.imageUrl),
                ),
                // child: ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
