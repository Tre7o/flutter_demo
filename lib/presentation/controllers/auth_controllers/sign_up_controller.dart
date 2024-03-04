import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/data/repos/user_repository.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get signUpController => Get.find();

  // TextFieldControllers to get data from the text fields
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthService.authService
        .registerWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(8),
      ));
    }
  }

  Future<void> createDBUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}
