import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/controllers/profile_controller.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

List<String> languages = ['english', 'luganda'];

class _LanguagePageState extends State<LanguagePage> {
  String currentOption = languages[0];

  final controller = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _loadLanguagePref();
  }

  Future<void> _loadLanguagePref() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentOption = prefs.getString('languagePref') ?? languages[0];
    });
  }

  Future<void> _saveLanguagePref(String language) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('languagePref', language);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Language',
        leadingWidget: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text('English'),
              trailing: Radio(
                value: languages[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                    controller.languagePref = currentOption;
                  });
                  _saveLanguagePref(currentOption);
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
              title: const Text('Luganda'),
              trailing: Radio(
                value: languages[1],
                groupValue:
                    currentOption, // whenever groupValue = value, this means that the radio button is selected
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                    controller.languagePref = currentOption;
                  });
                  _saveLanguagePref(currentOption);
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
