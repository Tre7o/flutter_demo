import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_demo/application/exceptions/auth_exceptions/sign_in_exception.dart';
import 'package:flutter_demo/application/exceptions/auth_exceptions/sign_up_exception.dart';
import 'package:flutter_demo/application/exceptions/auth_exceptions/update_exception.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_in_page.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_up_page.dart';
import 'package:flutter_demo/presentation/pages/main_page.dart';
import 'package:flutter_demo/presentation/screens/on_boarding.dart';
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

  // switch screen based on whether user is logged in or not
  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const OnBoardingScreen())
        : Get.offAll(() => const HomeScreen());
  }

  // switch between sign-in and sign-up screen
  void toggleScreens() {
    showSignInScreen = !showSignInScreen;
    showSignInScreen != true
        ? Get.offAll(() => const SignUpScreen())
        : Get.offAll(() => const SignInScreen());
  }

  // register a user in firebase auth
  Future<String?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.offAll(() => const OnBoardingScreen());
    } on FirebaseAuthException catch (firebaseExp) {
      final ex = SignUpWithEmailAndPasswordFailure.code(firebaseExp.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      return ex.message;
    } catch (_) {
      const exception = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${exception.message}');
      return exception.message;
    }
    return null;
  }

  // signing in a user
  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      user.value != null
          ? Get.offAll(() => const HomeScreen())
          : Get.offAll(() => const SignInScreen());
    } on FirebaseAuthException catch (firebaseEx) {
      final ex = SignInWithEmailAndPasswordFailure.code(firebaseEx.code);
      print('signInWithEmailAndPassword says ${ex.message}');
      print('signInWithEmailAndPassword says ${firebaseEx.code}');
      return ex.message;
    } catch (_) {
      const exception = SignInWithEmailAndPasswordFailure();
      print(exception.message);
      return exception.message;
    }
    return null;
  }

  // perform error handling during user data update
  Future<String?> reauthenticateUser(String email, String password) async {
    try {
      User? user = _auth.currentUser;

      // Re-authenticate the user
      await user!.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (firebaseEx) {
      final ex = UpdateFailure.code(firebaseEx.code);
      print('UpdateFailure says ${ex.message}');
      print('UpdateFailure says ${firebaseEx.code}');
      return ex.message;
    } catch (_) {
      const exception = UpdateFailure();
      print(exception.message);
      return exception.message;
    }
    return null;
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
