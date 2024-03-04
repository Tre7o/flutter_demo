import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:flutter_demo/presentation/controllers/auth_controllers/sign_up_controller.dart';
import 'package:get/get.dart';

import '../../../application/services/auth.dart';
import '../../../utils/constants.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final controller = Get.put(SignUpController());
  final _formKey =
      GlobalKey<FormState>(); // this _formKey is used to identify our form

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
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: textInputDecoration.copyWith(label: Text('Email')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.password,
                obscureText: true,
                decoration:
                    textInputDecoration.copyWith(label: Text('Password')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration:
                    textInputDecoration.copyWith(label: Text('Phone Number')),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UserModel(
                        name: controller.name.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        phoneNo: controller.phoneNo.text.trim());

                    SignUpController.signUpController.registerUser(
                        controller.email.text.trim(),
                        controller.password.text.trim());
                    print(controller.email.text.trim());
                    print(controller.password.text.trim());

                    SignUpController.signUpController.createDBUser(user);
                  }
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
