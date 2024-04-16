import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get signInController => Get.find();

  // TextFieldControllers to get data from the text fields
  final email = TextEditingController();
  final password = TextEditingController();

  // void loginUser(String email, String password) {
  //   AuthService.authService.signInWithEmailAndPassword(email, password);
  // }

  Future<void> loginUser(String email, String password) async {
    String? error = await AuthService.authService
        .signInWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(8),
      ));
      print('loginUser says $error');
    } else {
      Get.snackbar("Success", "You've logged in.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[100],
          margin: EdgeInsets.all(8),
          colorText: Colors.green);
    }
  }
}
