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
        // ignore: avoid_types_as_parameter_names, body_might_complete_normally_catch_error
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red[100],
          colorText: Colors.red);
    });
  }

  //fetching a user from firebase using email
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where('email', isEqualTo: email).get();
    // convert the document snapshot to a list
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  // fetching all users
  Future<List<UserModel>> returnAllUsers(String email) async {
    final snapshot = await _db.collection('Users').get();
    // convert the document snapshot to a list
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserData(UserModel user) async {
    try {

      final userDoc = await _db.collection('Users').doc(user.id).get();
      if (userDoc.exists) {
        await _db.collection('Users').doc(user.id).update(user.toJson());
        print('updateUserData: Document with ID ${user.id} updated successfully');
      } else {
        print('updateUserData: Document with ID ${user.id} does not exist');
        // Handle this case accordingly (e.g., create a new document or notify the user)
      }
    } on FirebaseException catch (e) {
      print('updateUserData says ${e.message}');
    }
  }
}
