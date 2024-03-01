import 'package:flutter/material.dart';

import '../../../application/services/auth.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBar({super.key, required this.titleText, this.leadingWidget, this.titleWidget});

  final String titleText;
  final Widget? leadingWidget;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: titleWidget ?? Text(titleText, style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 15),),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: PopupMenuButton(
            child: Icon(Icons.menu, color: Colors.black,),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    AuthService.authService.signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('Logout'),
                      ),
                      Icon(Icons.logout, color: Colors.black),
                    ],
                  ),
                ),
              )
            ],
          )
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 60);
}
