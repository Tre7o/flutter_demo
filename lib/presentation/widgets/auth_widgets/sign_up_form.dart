import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:flutter_demo/presentation/controllers/auth_controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../../application/services/auth.dart';
import '../../../utils/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final controller = Get.put(SignUpController());

  // final _authService = Get.put(AuthService());
  final _formKey =
      GlobalKey<FormState>(); // this _formKey is used to identify our form

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                decoration: textInputDecoration.copyWith(label: const Text('Name')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  if (value == " ") {
                    return 'Please enter your name';
                  }
                  if (value.length <= 2) {
                    return 'Enter a name longer than 2 characters';
                  }
                  List<String> words = value.split(' ');
                  // Check if the number of words is exactly two
                  if (words.length != 2) {
                    return 'Please enter only two names';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: textInputDecoration.copyWith(label: const Text('Email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!value.isEmail) {
                    return 'Email wrongly formatted';
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
                    textInputDecoration.copyWith(label: const Text('Password')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Password must contain at least one lowercase letter';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Password must contain at least one digit';
                  }
                  if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                    return 'Password must contain at least one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration:
                    textInputDecoration.copyWith(label: const Text('Phone Number')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!value.isNumericOnly) {
                    return 'Enter only numeric values(0-9)';
                  }
                  if (!(value.length == 10)) {
                    return 'Enter 10 digits for the phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 250,
              ),
              // FutureBuilder(builder: (context, snapshot) {

              // }),
              showLoader
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            showLoader = true;
                          });

                          final user = UserModel(
                              name: controller.name.text.trim(),
                              email: controller.email.text.trim(),
                              password: controller.password.text.trim(),
                              phoneNo: controller.phoneNo.text.trim());

                          String? result = await SignUpController
                              .signUpController
                              .registerUser(controller.email.text.trim(),
                                  controller.password.text.trim());
                          print(
                              'Result from sign-up-form ${result.toString()}');
                          // print(controller.email.text.trim());
                          // print(controller.password.text.trim());

                          if (result == null) {
                            SignUpController.signUpController
                                .createDBUser(user);
                            print('Result pass: $result');
                            Get.showSnackbar(const GetSnackBar(
                              message: 'Account was created successfully',
                              duration: Duration(seconds: 1),
                              margin: EdgeInsets.all(8),
                            ));
                          } else {
                            print('Result fail: $result');
                          }
                        }
                        setState(() {
                          showLoader = false;
                        });
                      },
                      style:
                          ElevatedButton.styleFrom(
                            minimumSize: const Size(350, 55),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.blue
                          ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Already have an account?"),
                  GestureDetector(
                      onTap: () {
                        AuthService.authService.toggleScreens();
                      },
                      child: const Text(
                        " Sign In!",
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
