import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/email_list_item.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/phone_list_item.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/profile_blocks/status/status_block.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Profile',
        leadingWidget: BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                child: Text('JT', style: TextStyle(fontSize: 25),),
                backgroundColor: Colors.blue,
                radius: 50,
              ),
            ),
            Container(
              // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              alignment: Alignment.center,
              height: 50,
              child: Text(
                'John Trevor'
              ),
            ),
            EmailListItem(),
            PhoneListItem(),
            StatusBlock(),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20, horizontal: 150)),
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
