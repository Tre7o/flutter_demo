import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/utils/constants.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controllers/sign_in_controller.dart';

class SignInForm extends StatefulWidget {
  
  SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final controller = Get.put(SignInController());

  final _formKey =
      GlobalKey<FormState>();  // this _formKey is used to identify our form

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                decoration: textInputDecoration.copyWith(label: Text('Email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                decoration:
                    textInputDecoration.copyWith(label: Text('Password')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 390,
              ),
              showLoader? CircularProgressIndicator() : ElevatedButton(
                onPressed: () async {
                                  
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      showLoader = true;
                    }); 
                    await SignInController.signInController.loginUser(
                      controller.email.text.trim(),
                      controller.password.text.trim()
                    );
                    
                  }
                  setState(() {
                    showLoader = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 150)),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                      onTap: () {
                        AuthService.authService.toggleScreens();
                      },
                      child: Text(
                        " Sign Up!",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ))
                ]),
              ),
            ],
          )),
    );
  }
}
