import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/presentation/pages/camera_page.dart';
import 'package:flutter_demo/presentation/pages/profile/edit_profile.dart';
import 'package:flutter_demo/presentation/pages/settings/language/language_page.dart';
import 'package:flutter_demo/presentation/pages/main_page.dart';
import 'package:flutter_demo/presentation/screens/on_boarding.dart';
import 'package:flutter_demo/presentation/pages/profile/profile_page.dart';
import 'package:flutter_demo/presentation/pages/settings/support/about_page.dart';
import 'package:flutter_demo/presentation/pages/settings/support/help_page.dart';
import 'package:get/get.dart';
import 'features/learning-module/presentation/pages/learning_page.dart';
import 'firebase_options.dart';

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
      home: const OnBoardingScreen(),
      title: "Signify",
      // initialBinding: GlobalBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/translator': (context) => const CameraPage(),
        '/profile': (context) => const ProfilePage(),
        '/language': (context) => const LanguagePage(),
        '/about': (context) => const AboutPage(),
        '/help': (context) => const HelpPage(),
        '/editprofile': (context) => const EditProfile(),
        '/learningpage': (context) => const LearningPage(
              title: 'Learn',
            )
      },
    );
  }
}
