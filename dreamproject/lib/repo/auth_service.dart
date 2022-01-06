import 'package:dreamproject/repo/database_service.dart';
import 'package:dreamproject/repo/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel Function(User? event)? get userFromFirebaseUser => null;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      print('sign out complete');
      return await _auth.signOut();
    } catch (e) {
      print('sign out failed');
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // add this code
      await DatabaseService(uid: user!.uid)
          .updateUserData('$email', '$password');

      return _userFromFirebaseUser(user);
    } catch (e) {
      print('sign up failed');
      print(e.toString());
      return null;
    }
  }
}
// UserModel? _userFromFirebaseUser(User? user) {
//   return user != null ? UserModel(uid: user.uid) : null;
// } 

  
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Stream<UserModel?> get userState {
//     print('trigger user getter...');
//     return _auth.authStateChanges().map(_userFromFirebaseUser);
//   }
//   /* Sign In anon */
//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       return _userFromFirebaseUser(user!);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }


 
// }
