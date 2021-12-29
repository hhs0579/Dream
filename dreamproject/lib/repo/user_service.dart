import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dreamproject/utils/logger.dart';

class UserService {
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
