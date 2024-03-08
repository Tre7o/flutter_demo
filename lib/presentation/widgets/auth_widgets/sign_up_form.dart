import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:flutter_demo/presentation/controllers/auth_controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../../application/services/auth.dart';
import '../../../utils/constants.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({super.key});

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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.name,
                decoration: textInputDecoration.copyWith(label: Text('Name')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: textInputDecoration.copyWith(label: Text('Email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
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
              TextFormField(
                controller: controller.phoneNo,
                decoration:
                    textInputDecoration.copyWith(label: Text('Phone Number')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
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
                  ? CircularProgressIndicator()
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

                          String? result =
                              await SignUpController.signUpController.registerUser(
                                  controller.email.text.trim(),
                                  controller.password.text.trim());
                          print('Result from sign-up-form ${result.toString()}');
                          // print(controller.email.text.trim());
                          // print(controller.password.text.trim());

                          if (result == null) {
                            SignUpController.signUpController
                                .createDBUser(user);
                            print('Result pass: ${result}');
                            Get.showSnackbar(GetSnackBar(
                              message: 'Account was created successfully',
                              duration: Duration(seconds: 1),
                              margin: EdgeInsets.all(8),
                            ));
                          } else {
                            print('Result fail: ${result}');
                          }
                          
                        }
                        setState(() {
                          showLoader = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 150)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already have an account?"),
                  GestureDetector(
                      onTap: () {
                        AuthService.authService.toggleScreens();
                      },
                      child: Text(
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
