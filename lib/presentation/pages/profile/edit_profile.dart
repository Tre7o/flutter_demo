import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/appbar.dart';
import 'package:flutter_demo/presentation/widgets/edit_form.dart';

import '../../widgets/auth_widgets/sign_up_form.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: 'Edit Profile',
        leadingWidget: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              height: 60,
              child: Text(
                'Update your account',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            EditProfileForm()
          ],
        ),
      ),
    );
  }
}
