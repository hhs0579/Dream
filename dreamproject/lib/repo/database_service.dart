import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  final String uid;
  String? downloadURL;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
    String _email,
    String _name,
    String _gender,
    String _phone,
    String _address,
    String _postcode,
  ) async {
    return await userCollection.doc(uid).set({
      'email': _email,
      'name': _name,
      'image': '',
      'gender': _gender,
      'myposts': [],
      'myempathyposts': [],
      'myclubs': [],
      'address': _address,
      'postcode': _postcode,
      'phone': _phone,
      'point': 0,
      'totaldonatepoint': 0,
      'totaldonatenumber': 0,
      'pushToken': ''
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
