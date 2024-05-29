import 'package:flutter/material.dart';

class HelpItem extends StatelessWidget {
  const HelpItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/help');
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Icon(Icons.help),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text('Help'),
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