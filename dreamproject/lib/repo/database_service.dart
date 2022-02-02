import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference clubCollection =
      FirebaseFirestore.instance.collection('clubs');

  Future setUserData(
    DateTime date,
    String _email,
    String _name,
    String _gender,
    String _password,
    String _phone,
    String _address,
    String _addressdetail,
    String _postcode,
  ) async {
    await userCollection.doc(uid).set({
      'date': date,
      'email': _email,
      'name': _name,
      'password': _password,
      'image': '',
      'gender': _gender,
      'myposts': [],
      'myempathyposts': [],
      'myclubs': [],
      'address': _address,
      'addressdetail': _addressdetail,
      'postcode': _postcode,
      'phone': _phone,
      'point': 0,
      'totaldonatepoint': 0,
      'totaldonatenumber': 0,
      'pushToken': '',
      'uid': uid
    });
  }

  Future updateUserData(
    String _name,
    String _password,
    String _gender,
    String _phone,
    String _address,
    String _addressdetail,
    String _postcode,
  ) async {
    await userCollection.doc(uid).update({
      'name': _name,
      'password': _password,
      'gender': _gender,
      'address': _address,
      'addressdetail': _addressdetail,
      'postcode': _postcode,
      'phone': _phone,
    });
  }

  Future setClubData(
    String _name,
    String _image,
  ) async {
    await clubCollection.doc(_name).set({
      'date': DateTime.now(),
      'name': _name,
      'image': _image,
      'clubmaster': uid,
      'clubuserlist': [uid],
      'clubuser': 1,
      'clubdonatepoint': 0,
      'isaccsess': false
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
