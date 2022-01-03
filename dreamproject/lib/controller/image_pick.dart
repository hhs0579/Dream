import 'package:dreamproject/controller/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

ImagePickUploader imagePickUploader = ImagePickUploader();

class ImagePickUploader {
  final _picker = ImagePicker();
  Future<String?> pickAndUpload(
    String uploadPath,
  ) async {
    try {
      XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      print(image?.path ?? 'null');
      if (image != null) {
        var result = await firebaseStorageController.uploadFile(
          filePath: image.path,
          uploadPath: uploadPath,
        );

        return result;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<String>> pickAndUploadMultiple(String uploadPath,
      {required int maxNumOfImages}) async {
    List<String> imageUrls = [];
    try {
      List<XFile>? images = await _picker.pickMultiImage();

      if (images != null) {
        if (images.length > maxNumOfImages) {
          Fluttertoast.showToast(
              msg: '이미지가 너무 많습니다',
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.lightBlue,
              fontSize: 12.0);
          return imageUrls;
        }
        int index = 0;
        for (var image in images) {
          String? result;
          try {
            result = await firebaseStorageController.uploadFile(
              filePath: image.path,
              uploadPath: uploadPath + (index++).toString(),
            );
          } catch (e) {
            print('error!!');
            print(e.toString());
          }
          if (result != null) {
            print('good');
            imageUrls.add(result);
          }
        }

        return imageUrls;
      }
    } catch (e) {
      print(e.toString());
    }
    return imageUrls;
  }
}
