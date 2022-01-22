import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/data/appdata.dart';
import 'package:dreamproject/repo/image_helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

Imageservice imageservice = Imageservice();

class Imageservice {
  File? image;
  final _picker = ImagePicker();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  void prepareService() async {
    _user = _firebaseAuth.currentUser;
  }

  uploadImageToStorage() async {
    prepareService();
    XFile? result = await _picker.pickImage(source: ImageSource.gallery);
    AppData appdata = AppData();
    if (result != null) {
      image = File(result.path);
      Reference storageReference =
          firebaseStorage.ref().child("profile/${_user?.uid}");

      File resultImage = imagehelper.getResizedImage(image!);

      final TaskSnapshot snapshot = await storageReference.putFile(resultImage);
      String downloadURL = await snapshot.ref.getDownloadURL();

      appdata.myInfo.image = downloadURL;
      await userCollection.doc(_user?.uid).update({'image': downloadURL});

      print(appdata.myInfo.image);
    } else {
      Fluttertoast.showToast(
          msg: '오류가 발생했습니다.',
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.lightBlue,
          fontSize: 12.0);
    }
  }
}
