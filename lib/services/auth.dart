import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on FirebaseUser
  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Sign in Anon
  Future signInAnon() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return print(e.toString());
    }
  }

  // Sign in with email & password

  // Register with email & password

  // Sign out
}
