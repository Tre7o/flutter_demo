import 'package:flutter/material.dart';
import 'package:flutter_demo/application/services/auth.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/account_block.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/general_block.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_block/support_block.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const AccountBlock(),
            const SizedBox(
              height: 10,
            ),
            const GeneralBlock(),
            const SizedBox(
              height: 10,
            ),
            const SupportBlock(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
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
            )
          ],
        ),
      ),
    );
  }
}
