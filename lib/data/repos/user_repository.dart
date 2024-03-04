import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/user_model.dart';

// holds methods to perform database transactions

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future createUser(UserModel user) async {
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green[100],
            margin: EdgeInsets.all(8),
            colorText: Colors.green))
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red[100],
            colorText: Colors.red);
      });
  }
}
