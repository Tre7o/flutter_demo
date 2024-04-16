import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'Help',
        leadingWidget: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}