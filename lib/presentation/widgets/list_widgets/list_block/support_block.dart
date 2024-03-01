import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_item/language_item.dart';
import 'package:get/get.dart';

import '../list_item/about_item.dart';
import '../list_item/help_item.dart';

class SupportBlock extends StatelessWidget {
  const SupportBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 25, 30),
      child: Container(
        height: Get.height * 0.2,
        width: Get.width,
        child: const Column(
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
    );
  }
}
