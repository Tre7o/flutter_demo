import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneListItem extends StatelessWidget {
  const PhoneListItem({super.key, this.userNumber});

  final String? userNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
      child: SizedBox(
        height: Get.height * 0.120,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                'Phone number',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  userNumber!,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ]),
            const Divider(
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
