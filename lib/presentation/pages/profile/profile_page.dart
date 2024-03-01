import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

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

    );
  }
}
