import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

List<String> languages = ['english', 'luganda'];

class _LanguagePageState extends State<LanguagePage> {

  String currentOption = languages[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Language Preference',
        leadingWidget: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 25, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('English'),
              trailing: Radio(
                value: languages[0],
                groupValue: currentOption,
                onChanged: (value){
                  setState(() {
                    currentOption = value.toString();
                  });
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
              title: Text('Luganda'),
              trailing: Radio(
                value: languages[1],
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