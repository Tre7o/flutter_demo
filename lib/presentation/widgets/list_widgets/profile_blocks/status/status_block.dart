import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatusBlock extends StatefulWidget {
  const StatusBlock({super.key});

  @override
  State<StatusBlock> createState() => _StatusBlockState();
}

List<String> statuses = ['hearing', 'deaf'];

class _StatusBlockState extends State<StatusBlock> {
  String currentOption = statuses[0];

  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentOption = prefs.getString('status') ?? statuses[0];
    });
  }

  Future<void> _saveStatus(String status) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('status', status);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 25, 20),
      child: SizedBox(
        height: Get.height * 0.25,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'Status',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: const Text('Hearing'),
              trailing: Radio(
                value: statuses[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                    controller.status = currentOption;
                  });
                  _saveStatus(currentOption);
                },
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            ListTile(
              title: const Text('Deaf'),
              trailing: Radio(
                value: statuses[1],
                groupValue:
                    currentOption, // whenever groupValue = value, this means that the radio button is selected
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                    controller.status = currentOption;
                  });
                  _saveStatus(currentOption);
                },
              ),
            ),
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
