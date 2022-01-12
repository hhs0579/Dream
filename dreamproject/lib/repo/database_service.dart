import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String _email,
      String _name,
      String _password,
      String _gender,
      String _phoneNumber,
      String _address,
      String _postcode) async {
    return await userCollection.doc(uid).set({
      'uid': uid,
      'email': _email,
      'name': _name,
      'gender': _gender,
      'password': _password,
      'address': _address,
      'postcode': _postcode,
      'phoneNumber': _phoneNumber,
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
