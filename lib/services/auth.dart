import 'package:firebase_auth/firebase_auth.dart';
import 'package:easypisy/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser

  UserObject? _userFromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? UserObject(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<UserObject?> get getUser {
    print('authorisation state changed');
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      if (user == null) {
        return null;
      } else {
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      print(' trying to sign in ');
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user == null) {
        return null;
      } else {
        print('sign in successful user id --- ');
        print(_userFromFirebaseUser(user)!.uid);
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(' error in signing in ');
      print(e.toString());
      return null;
    }
  }

  // register with email_id
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      // create a doc to a new user

      // ignore: unnecessary_null_comparison
      if (user == null) {
        return null;
      } else {
        print('uid --- ');
        print(_userFromFirebaseUser(user)!.uid);
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut().catchError((e) {
        print('error sign out');
      });
    } catch (e) {
      print('error signing out');
      print(e.toString());
      return null;
    }
  }
}
