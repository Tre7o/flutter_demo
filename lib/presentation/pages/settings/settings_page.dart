import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/presentation/pages/main_page.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/account_block.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/general_block.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/support_block.dart';
import 'package:get/get.dart';

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
        children: [
          SizedBox(
            height: 20,
          ),
          AccountBlock(),
          SizedBox(
            height: 20,
          ),
          GeneralBlock(),
          SizedBox(
            height: 20,
          ),
          SupportBlock(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                TextButton.icon(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      minimumSize: Size(80, 50)),
                  onPressed: () {
                    AuthService.authService.signOut();
                  },
                  label: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
