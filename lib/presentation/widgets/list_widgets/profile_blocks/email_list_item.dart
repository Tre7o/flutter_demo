import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailListItem extends StatefulWidget {
  const EmailListItem({super.key});

  @override
  State<EmailListItem> createState() => _EmailListItemState();
}

class _EmailListItemState extends State<EmailListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 25, 0),
      child: Container(
        height: Get.height * 0.120,
        width: Get.width,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 5, 0, 10),
              child: Text(
                'Email',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text('name@gmail.com', style: TextStyle(color: Colors.grey),),
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

