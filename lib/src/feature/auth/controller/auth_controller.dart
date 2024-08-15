import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/services/auth_service.dart';
import 'package:gemicates_machine_task/src/feature/auth/model/user_model.dart';

class AuthController extends ChangeNotifier {
  final AuthService authService = AuthService();

  bool isLoading = false;
  String? result;

  Future<void> signUp(UserModel user) async {
    isLoading = true;
    notifyListeners();

    final response = await authService.signUpUser(user);
    result = response;
    isLoading = false;
    notifyListeners();
    log('Result from signing up from controller: $result');
    await authService.saveUserStatus(true);
  }

  Future<void> signIn(UserModel user) async {
    isLoading = true;
    notifyListeners();

    final response = await authService.signInUser(user);
    result = response;
    isLoading = false;
    notifyListeners();
    log('Result from signing in from controller: $result');
    await authService.saveUserStatus(true);
  }

  Future<void> signOut() async {
    await authService.signOutUser();
    await authService.saveUserStatus(false);
    notifyListeners();
  }
}
