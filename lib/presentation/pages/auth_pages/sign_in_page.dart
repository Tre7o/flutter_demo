import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/auth_widgets/sign_in_form.dart';

import '../../widgets/appbars/appbar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: 'Sign In',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 60,
              child: const Text('Log in to your account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            ),
            const SignInForm()
          ],
        ),
      ),
    );
  }
}