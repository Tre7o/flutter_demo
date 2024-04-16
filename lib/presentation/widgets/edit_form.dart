import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:flutter_demo/presentation/controllers/auth_controllers/sign_up_controller.dart';
import 'package:flutter_demo/presentation/controllers/profile_controller.dart';
import 'package:flutter_demo/presentation/pages/profile/profile_page.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class EditProfileForm extends StatefulWidget {
  EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final controller = Get.put(ProfileController());

  final _formKey = GlobalKey<FormState>();
  // this _formKey is used to identify our form
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // if data is completely fetched
            if (snapshot.hasData) {
              // if snapshot has data
              UserModel userData = snapshot.data as UserModel;

              // TextFieldControllers to get data from the text fields
              final name = TextEditingController(text: userData.name);
              final email = TextEditingController(text: userData.email);
              final password = TextEditingController(text: userData.password);
              final phoneNo = TextEditingController(text: userData.phoneNo);

              return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration:
                            textInputDecoration.copyWith(label: Text('Name')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        decoration:
                            textInputDecoration.copyWith(label: Text('Email')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(
                            label: Text('Password')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneNo,
                        decoration: textInputDecoration.copyWith(
                            label: Text('Phone Number')),
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final user = UserModel(
                              id: userData.id,
                              name: name.text.trim(),
                              email: email.text.trim(),
                              password: password.text.trim(),
                              phoneNo: phoneNo.text.trim());
                            await controller.updateRecord(user);
                            Get.off(() => ProfilePage());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(500, 55),
                            backgroundColor: Colors.grey),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: Text('Something went wrong'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
