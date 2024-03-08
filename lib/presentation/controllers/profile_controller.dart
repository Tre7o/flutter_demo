import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/data/repos/user_repository.dart';
import 'package:get/get.dart';

import '../../domain/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authService = Get.put(AuthService());
  final _userRepo = Get.put(UserRepository());

  // get user emai; and pass it to the UserRepository to fetch user record
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

  // updating user record
  updateRecord(UserModel user) async {
    await _userRepo.updateUserData(user);
  }
}
