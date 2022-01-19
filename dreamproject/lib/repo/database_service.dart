import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String _email,
      String _name,
      String _gender,
      String _phoneNumber,
      List<dynamic> _myposts,
      List<dynamic> _empathyposts,
      List<dynamic> _myclubs,
      String _address,
      String _postcode,
      String _point,
      String _totaldonationpoint,
      String _totaldonationnumber) async {
    return await userCollection.doc(uid).set({
      'email': _email,
      'name': _name,
      'gender': _gender,
      'mypost': _myposts,
      'empathypost': _empathyposts,
      'myclub': _myclubs,
      'address': _address,
      'postcode': _postcode,
      'phoneNumber': _phoneNumber,
      'point': _point,
      'totaldonationpoint': _totaldonationpoint,
      'totaldonationnumber': _totaldonationnumber
    });
  }

  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}
