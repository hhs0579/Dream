import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});


  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(String _address, String _email, String _password,
      String _phoneNumber, String _name) async {

    return await userCollection.doc(uid).set({
      'uid': uid,
      'email': _email,
      'password': _password,
      'address': _address,
      'phoneNumber': _phoneNumber,
      'name': _name
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
