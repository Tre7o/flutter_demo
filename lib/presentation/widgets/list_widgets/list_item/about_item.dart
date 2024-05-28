import 'package:flutter/material.dart';

class AboutItem extends StatelessWidget {
  const AboutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/about');
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Icon(Icons.info),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('About'),
            ),
          ]),
          Icon(
            Icons.arrow_right_sharp,
            size: 50,
          ),
        ],
      ),
    );
  }
}