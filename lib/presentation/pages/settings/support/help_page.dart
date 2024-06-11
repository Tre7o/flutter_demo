import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Help',
        leadingWidget: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Translation Guide",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Here's a guide to get you started on using the Signify translator",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const ExpansionTile(
                title: Text(
                  'How to use the translator',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 16, 0, 0),
                    child: Text(
                      'Tap the capture button in the middle to start recording',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 16, 0, 0),
                    child: Text(
                      "Position the subject's hand within the frame and perform the desired sign",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 16, 0, 0),
                    child: Text(
                      'Tap the capture button again to end the translation.',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 16, 0, 16),
                    child: Text(
                      'The blue button in the right most corner is for speech output',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text(
                  'Translations not accurate enough',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 16, 16),
                    child: Text(
                      'Tap the record button to stop recording and tap it again to resume recording',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 16, 0, 16),
                    child: Text(
                      'Make sure there is ample lighting, natural lighting breeds better results',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text(
                  'Detection slow, or device heating up',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 16, 16),
                    child: Text(
                      "Clear your phone's cache, and restart the application or the device",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Profile Management",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "How to manage your account or profile",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ExpansionTile(
                title: const Text(
                  'Selecting hearing status and language preferences',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
                      // child: Text(
                      //   'Hearing status is on the Profile page, and language preferences is on the Language Preferences page',
                      //   style: TextStyle(fontSize: 15.0),
                      // ),
                      child: RichText(
                          text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(text: "Hearing status is on the "),
                            TextSpan(
                                text: "Profile ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    "page, and language preferences are on the "),
                            TextSpan(
                                text: "Language Preferences ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: "page"),
                          ])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 16, 16, 16),
                    // child: Text(
                    //   'You can see the selected options on the Edit Profile page, in case you want to change these options simply tap their respective containers',
                    //   style: TextStyle(fontSize: 15.0),
                    // ),
                    child: RichText(
                        text: const TextSpan(
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: "You can see the selected options on the "),
                          TextSpan(
                              text: "Edit Profile ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  "page, in case you want to change these options simply tap their respective containers")
                        ])),
                  ),
                ],
              ),
              const ExpansionTile(
                title: Text(
                  'Profile taking long to load',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 8, 16, 16),
                    child: Text(
                      'Ensure an active and healthy internet connection',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[200]),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.headphones,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              "Need more help?",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "For more questions and guidance on the application, reach out using the contact information below",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "Email: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "help@signify-slc.com",
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "Phone number: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("0784 59378")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // How to use the translator
              // - Stay within 3 feet of the hand
              // - Make sure there's ample lighting, natural lighting breeds better results
              // - Press the record button in the middle to start recording
            ],
          ),
        ),
      ),
    );
  }
}
