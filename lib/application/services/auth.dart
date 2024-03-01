import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/application/exceptions/sign_up_exception.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_in_page.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_up_page.dart';
import 'package:flutter_demo/presentation/pages/camera_page.dart';
import 'package:flutter_demo/presentation/pages/main_screen.dart';
import 'package:flutter_demo/presentation/pages/on_boarding.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  static AuthService get authService => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> user;
  bool showSignInScreen = false;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2));
    user = Rx<User?>(_auth.currentUser);
    user.bindStream(_auth.userChanges());
    ever(user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => OnBoardingScreen())
        : Get.offAll(() => HomeScreen());
  }

  void toggleScreens() {
    showSignInScreen = !showSignInScreen;
    showSignInScreen != true
        ? Get.offAll(() => SignUpScreen())
        : Get.offAll(() => SignInScreen());
  }

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user.value != null
          ? Get.offAll(() => HomeScreen())
          : Get.offAll(() => OnBoardingScreen());
    } on FirebaseAuthException catch (firebaseExp) {
      final ex = SignUpWithEmailAndPasswordFailure.code(firebaseExp.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    } catch (_) {
      const exception = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${exception.message}');
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      user.value != null
          ? Get.offAll(() => HomeScreen())
          : Get.offAll(() => SignInScreen());
    } on FirebaseAuthException catch (firebaseExp) {
      print(firebaseExp.message);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
