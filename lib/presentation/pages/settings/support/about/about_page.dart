import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/widgets/appbars/mainbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBar(
        titleText: 'About',
        leadingWidget: BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                child: Image.asset('assets/images/image.png'),
                
                radius: 50,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(
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