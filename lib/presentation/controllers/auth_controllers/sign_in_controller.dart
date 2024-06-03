import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get signInController => Get.find();

  // TextFieldControllers to get data from the text fields
  final email = TextEditingController();
  final password = TextEditingController();

  // logging in a user
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthService.authService
        .signInWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: const Duration(seconds: 1),
        margin: const EdgeInsets.all(8),
      ));
      print('loginUser says $error');
    } else {
      Get.showSnackbar(const GetSnackBar(
        message: "You've logged in",
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(8),
      ));
    }
  }
}
