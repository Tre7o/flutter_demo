import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/controllers/profile_controller.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/email_list_item.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/phone_list_item.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/status/status_block.dart';
import 'package:get/get.dart';

import '../../../domain/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller = Get.put(ProfileController());

  String getInitials(String name) {
    final String initials;

    List<String> words = name.split(' ');

    if (words.length > 1) {
      final splitted = name.split(' ');
      final firstInitial = splitted[0].substring(0, 1);
      final lastInitial = splitted[1].substring(0, 1);
      initials = firstInitial + lastInitial;
    } else {
      initials = name.substring(0, 1);
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Profile',
        leadingWidget: const BackButton(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
          future: controller.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // if data is completely fetched
              if (snapshot.hasData) {
                // if snapshot has data
                UserModel userData = snapshot.data as UserModel;
                print(userData.id);
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 50,
                          child: Text(
                            getInitials(userData.name),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      Container(
                        // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        alignment: Alignment.center,
                        height: 50,
                        child: Text(userData.name),
                      ),
                      EmailListItem(
                        userEmail: userData.email,
                      ),
                      PhoneListItem(
                        userNumber: userData.phoneNo,
                      ),
                      const StatusBlock(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/editprofile');
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 55)),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                );
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
          }),
    );
  }
}
