import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/list_widgets/list_item/language_item.dart';
import 'package:get/get.dart';

class GeneralBlock extends StatelessWidget {
  const GeneralBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 25, 30),
      child: SizedBox(
        height: Get.height * 0.125,
        width: Get.width,
        child: const Column(
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
    );
  }
}
