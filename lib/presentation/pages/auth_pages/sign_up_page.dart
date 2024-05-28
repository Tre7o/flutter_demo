import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/appbar.dart';

import '../../widgets/auth_widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: 'Sign Up',
        leadingWidget: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 60,
              child: const Text(
                'Create an account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SignUpForm()
          ],
        ),
      ),
    );
  }
}
