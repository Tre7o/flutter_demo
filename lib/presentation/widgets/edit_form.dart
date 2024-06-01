import 'package:flutter/material.dart';
import 'package:flutter_demo/domain/models/user_model.dart';
import 'package:flutter_demo/presentation/controllers/profile_controller.dart';
import 'package:flutter_demo/presentation/pages/profile/profile_page.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final controller = Get.put(ProfileController());

  final _formKEY = GlobalKey<FormState>();
  // this _formKEY is used to identify our form

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                  key: _formKEY,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration:
                            textInputDecoration.copyWith(label: const Text('Name')),
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
                            return 'Please enter two names';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneNo,
                        decoration: textInputDecoration.copyWith(
                            label: const Text('Phone Number')),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
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
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, "/profile");
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.grey)),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Status:",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      controller.status.isEmpty
                                          ? const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Not selected",
                                              ),
                                            )
                                          : Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                controller.status,
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, "/language");
                              },
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      const Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Language Preference:",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      controller.languagePref.isEmpty
                                          ? const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Not selected",
                                              ),
                                            )
                                          : Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                controller.languagePref,
                                                style: const TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 300,
                      ),
                      showLoader
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKEY.currentState!.validate()) {
                                  setState(() {
                                    showLoader = true;
                                  });
                                  final user = UserModel(
                                      id: userData.id,
                                      name: name.text.trim(),
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                      status: controller.status,
                                      languagePref: controller.languagePref);
                                  
                                  // perform some error handling
                                  String? result =
                                      await controller.updateUserDetails(user);
                                  print(
                                      'Result from edit-form ${result.toString()}');

                                  if (result == null) {
                                    await controller.updateRecord(user);
                                    Get.off(() => ProfilePage());
                                  } else {
                                    print('Result fail: ${result}');
                                  }

                                  // await controller.updateRecord(user);
                                  // Get.off(() => const ProfilePage());
                                } else {
                                  print("Form not validated");
                                }

                                setState(() {
                                  showLoader = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(500, 55),
                                  backgroundColor: Colors.grey),
                              child: const Text(
                                "Save Changes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ],
                  ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
