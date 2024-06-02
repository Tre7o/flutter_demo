import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import '../../widgets/list_widgets/list_item/about_item.dart';
import '../../widgets/list_widgets/list_item/help_item.dart';
import '../../widgets/list_widgets/list_item/language_item.dart';
import '../../widgets/list_widgets/list_item/profile_item.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Settings',
        leadingWidget: null,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 25, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text(
                      'Account',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ProfileItem(),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 25, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text(
                      'General',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  LanguageItem(),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 25, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    child: Text(
                      'Support',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  AboutItem(),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  ),
                  HelpItem(),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    indent: 5,
                    endIndent: 5,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black),
                        minimumSize: const Size(80, 50)),
                    onPressed: () {
                      AuthService.authService.signOut();
                    },
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.black),
                    ),
                    icon: const Icon(
                      Icons.power_settings_new,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
