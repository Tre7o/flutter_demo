import 'package:flutter/material.dart';

import '../../widgets/appbars/homebar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeBar(titleText: 'SIGN TALK'),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello, there',  
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w100)
              ),
            ),
            Container(
              height: 220,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[400],
              ),
              
            ),
            SizedBox(height: 20),
            Container(
                width: 250,
                height: 250,
                child: Center(
                  child: Text(
                    'What do you want to do today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 45, color: Colors.black),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/translator');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: Size(300, 50)
              ),
              child: const Text(
                "Translate",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/translator');
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black, width: 1),
                minimumSize: Size(300, 50)
              ),
              child: const Text(
                "Learn",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}