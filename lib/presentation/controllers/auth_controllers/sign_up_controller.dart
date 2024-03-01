import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get signUpController => Get.find();

  // TextFieldControllers to get data from the text fields
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    AuthService.authService.registerWithEmailAndPassword(email, password);
  }
}
