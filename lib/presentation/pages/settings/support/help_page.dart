import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Help',
        leadingWidget: const BackButton(
          color: Colors.black,
        ),
      ),
      body: const Column(
        children: [
          // How to use the translator
          // - Stay within 3 feet of the hand
          // - Make sure there's ample lighting, natural lighting breeds better results
          // - Press the record button in the middle to start recording
        ],
      ),
    ); 
  }
}