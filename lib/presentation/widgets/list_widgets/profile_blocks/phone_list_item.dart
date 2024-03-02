import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneListItem extends StatefulWidget {
  const PhoneListItem({super.key});

  @override
  State<PhoneListItem> createState() => _PhoneListItemState();
}

class _PhoneListItemState extends State<PhoneListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 25, 0),
      child: Container(
        height: Get.height * 0.120,
        width: Get.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                'Phone number',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text('0702392191', style: TextStyle(color: Colors.grey),),
              ),
            ]),
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
