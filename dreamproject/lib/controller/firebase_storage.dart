import 'package:extended_image/extended_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FirebaseStorageController firebaseStorageController =
    FirebaseStorageController();

class FirebaseStorageController {
  Future<String?> uploadFile(
      {required String filePath, required String uploadPath}) async {
    File file = File(filePath);

    try {
      var task = await FirebaseStorage.instance.ref(uploadPath).putFile(file);

      return await task.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.code);
      Fluttertoast.showToast(
          msg: (e.code),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue,
          fontSize: 12.0);
    }
  }

  deleteFile(String url) async {
    try {
      print(url);
      await FirebaseStorage.instance.refFromURL(url).delete();
    } on FirebaseException catch (e) {
      print(e.code);
      Fluttertoast.showToast(
          msg: (e.code),
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue,
          fontSize: 12.0);
    }
  }
}
