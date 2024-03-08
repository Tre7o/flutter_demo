import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_up_page.dart';
import 'package:flutter_demo/presentation/pages/camera_page.dart';
import 'package:flutter_demo/presentation/pages/profile/edit_profile.dart';
import 'package:flutter_demo/presentation/pages/settings/language/language_page.dart';
import 'package:flutter_demo/presentation/pages/main_page.dart';
import 'package:flutter_demo/presentation/pages/on_boarding.dart';
import 'package:flutter_demo/presentation/pages/profile/profile_page.dart';
import 'package:flutter_demo/presentation/pages/settings/support/about/about_page.dart';
import 'package:flutter_demo/presentation/pages/settings/support/help_page.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'global_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthService()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(const MyApp());
      });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),
      title: "Sign Talk",
      initialBinding: GlobalBindings(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/translator': (context) => CameraPage(),
        '/profile': (context) => ProfilePage(),
        '/language': (context) => LanguagePage(),
        '/about': (context) => AboutPage(),
        '/help': (context) => HelpPage(),
        '/editprofile': (context) => EditProfile(),
      },
    );
  }
}
