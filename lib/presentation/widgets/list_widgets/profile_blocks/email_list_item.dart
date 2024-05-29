import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailListItem extends StatelessWidget {
  const EmailListItem({super.key, this.userEmail});

  final String? userEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 25, 0),
      child: SizedBox(
        height: Get.height * 0.120,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  userEmail!,
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
