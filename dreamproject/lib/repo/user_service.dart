import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/constants/data_keys.dart';
import 'package:dreamproject/utils/logger.dart';

class UserService {
  static final UserService _userService = UserService._internal();
  factory UserService() => _userService;
  UserService._internal();

  Future createNewUser(Map<String, dynamic> json, String userKey) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        FirebaseFirestore.instance.collection(COL_USERS).doc(userKey);
    final DocumentSnapshot documentSnapshot = await documentReference.get();

    if (!documentSnapshot.exists) {
      await documentReference.set(json);
    }
  }

  Future firestoreTest() async {
    FirebaseFirestore.instance
        .collection('testing')
        .add({'testing': 'testing value', 'number': 123123});
  }

  void firestoreReadTest() {
    FirebaseFirestore.instance
        .collection('testing')
        .doc('HQLhoZ6XTAx0BpYqaySM')
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> value) =>
            logger.d(value.data()));
  }
}
