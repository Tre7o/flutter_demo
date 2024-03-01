import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get signInController => Get.find();

  // TextFieldControllers to get data from the text fields
  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthService.authService.signInWithEmailAndPassword(email, password);
  }
}
