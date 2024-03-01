import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        // child: Text(
        //   'Loading...',
        //   style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        // ),
        child: SpinKitChasingDots(
          color: Colors.grey,
          size: 50.0,
        ),
      ),
    );
  }
}