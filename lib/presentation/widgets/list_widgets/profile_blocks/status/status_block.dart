import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusBlock extends StatefulWidget {
  const StatusBlock({super.key});

  @override
  State<StatusBlock> createState() => _StatusBlockState();
}

List<String> statuses = ['deaf', 'hearing'];

class _StatusBlockState extends State<StatusBlock> {

  String currentOption = statuses[0];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
      child: Container(
        height: Get.height * 0.25,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text('Deaf'),
              trailing: Radio(
                value: statuses[0],
                groupValue: currentOption,
                onChanged: (value){
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            ListTile(
              title: Text('Hearing'),
              trailing: Radio(
                value: statuses[1],
                groupValue: currentOption, // whenever groupValue = value, this means that the radio button is selected
                onChanged: (value){
                  setState(() {
                    currentOption = value.toString();
                  });
                },
              ),
            ),
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
