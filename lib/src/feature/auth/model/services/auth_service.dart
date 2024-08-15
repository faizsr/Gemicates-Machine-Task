import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<String> signUpUser(UserModel user) async {
    // ========== Signing Up NewUser ==========
    try {
      final result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password!);
      log('Sign Up Sucess: $result');
      // ========== Creating Collection ==========
      final userCollection = fireStore.collection('users');
      final uid = auth.currentUser?.uid ?? 'newuser';

      userCollection.doc(uid).get().then(
        (userDoc) {
          final newUser = UserModel(
            name: user.name,
            email: user.email,
          ).toMap();

          userCollection.doc(uid).set(newUser);
          log('User Added');
        },
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String> signInUser(UserModel user) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password!);
      log('Sign In Success: $result');
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> signOutUser() async {
    await auth.signOut();
  }

  Future<bool> getUserStatus() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final bool? status = sharedPreferences.getBool('SIGNIN');
    return status ?? false;
  }

  Future<void> saveUserStatus(bool status) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('SIGNIN', status);
  }
}
