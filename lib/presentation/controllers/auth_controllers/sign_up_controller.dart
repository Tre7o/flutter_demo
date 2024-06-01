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

  // registering a user in firebase auth
  Future<String?> registerUser(String email, String password) async {
    String? error = await AuthService.authService
        .registerWithEmailAndPassword(email, password);
    print('registerUser says $error');
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

  // storing the user in the database
  Future<void> createDBUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}
