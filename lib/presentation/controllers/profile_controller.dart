import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/data/repos/user_repository.dart';
import 'package:get/get.dart';

import '../../domain/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authService = Get.put(AuthService());
  final _userRepo = Get.put(UserRepository());
  var status = '';
  var languagePref = '';

  // get user email and pass it to the UserRepository to fetch user record
  getUserData() {
    final email = _authService.user.value?.email;
    if (email != null) {
      print('profile_controller says $email');
      // return null;
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Log in to continue');
    }
  }

  // leveraging auth exceptions to handle errors
  Future<String?> updateUserDetails(UserModel user) async {
    String? error = await _authService.reauthenticateUser(
        user.email, user.password);
    print('updateUserDetails says $error');
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(8),
      ));
      return error;
    } else {
      return null;
    }
  }

  // updating user record
  updateRecord(UserModel user) async {
    await _userRepo.updateUserData(user);
  }
}
