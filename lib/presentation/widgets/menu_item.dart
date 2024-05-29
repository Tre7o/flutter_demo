import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopupMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Logout'),
          Icon(Icons.logout, color: Colors.black,),
        ],
      ),

      // child: GestureDetector(
      //   onTap: () {
      //     AuthService.authService.signOut();
      //   },
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text('Logout'),
      //       Icon(Icons.logout),
      //     ],
      //   ),
      // ),
    );
  }
}
