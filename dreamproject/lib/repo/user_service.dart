import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  void firestoreTest() {
    final userCollectionReference =
        FirebaseFirestore.instance.collection("users").doc("userkey1");
    userCollectionReference.set({"userName": "이정찬", "age": 24});
  }
}
