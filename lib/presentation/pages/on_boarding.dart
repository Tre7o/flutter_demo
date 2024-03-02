import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_up_page.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/onboarding.jpg')
                )
              ),
            ),
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  Text('Welcome to Sign Talk', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Text(
                      'Your one stop to all your sign language conversion needs, here to bridge the gap between the deaf and hearing community',
                      style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            OutlinedButton(
              onPressed: (){
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
              }, 
              child: Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black, width: 1),
                minimumSize: Size(300, 50)
              ),
            )
          ], 
        ),
      ),
    );
  }
}