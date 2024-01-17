import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loan_app/Models/UserObj.dart';
import 'package:loan_app/services/realtimeDatabase.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object
  UserObj? _userFromFirebaseUser(User? user) {
    return user != null
        ? UserObj(uid: user.uid, mail: user.email.toString())
        : null;
  }

  //Auth change stream
  Stream<UserObj?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //Register with email & password
  Future registerEmail(String email, String pass, String name) async {
    try {
      FirebaseApp tempApp = await Firebase.initializeApp(
          name: 'temporaryregister', options: Firebase.app().options);
      // UserCredential result = await FirebaseAuth.instanceFor(app: tempApp)
      //     .createUserWithEmailAndPassword(email: email, password: pass);
      UserCredential result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      User? _user = result.user;
      _user?.updateDisplayName(name);
      print('User Created');
      await RealtimeDatabase()
          .updateUserData(_user!.uid, name, 'Processing', false, false);
      // await DatabaseService(uid: _user?.uid).updateUserData(
      //   _user?.displayName??'none',
      //   'Processing',
      //   false,
      //   false
      // );
      tempApp.delete();
      return _userFromFirebaseUser(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in with email & password
  Future signInEmail(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? _user = result.user;
      return _userFromFirebaseUser(_user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      print('Error while Logging out');
      return null;
    }
  }

  //Sign out
}
