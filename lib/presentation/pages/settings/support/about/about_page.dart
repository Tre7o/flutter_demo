import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'About',
        leadingWidget: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Image.asset('assets/images/image.png'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Sign Talk',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w100),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Version 1.0.0',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
