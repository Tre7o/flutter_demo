import 'package:flutter/material.dart';
import 'package:flutter_demo/presentation/pages/auth_pages/sign_up_page.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: Get.height - 110,
              
              child: Center(
                child: Text("Welcome to Sign Talk", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
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