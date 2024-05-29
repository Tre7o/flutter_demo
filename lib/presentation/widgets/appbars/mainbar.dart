import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../application/services/auth.dart';
import '../../pages/main_page.dart';

// ignore: must_be_immutable
class MainBar extends StatelessWidget implements PreferredSizeWidget {
  MainBar(
      {super.key,
      required this.titleText,
      this.leadingWidget,
      this.titleWidget});

  final String titleText;
  final Widget? leadingWidget;
  final Widget? titleWidget;

  var firstOption = 1;
  var secondOption = 2;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      leading: leadingWidget,
      title: titleWidget ??
          Text(
            titleText,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
          ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: PopupMenuButton(
            child: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: firstOption,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Home'),
                    ),
                    Icon(Icons.home_rounded, color: Colors.black),
                  ],
                ),
              ),
              PopupMenuItem(
                value: secondOption,
                child: const Row(
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
            ],
            onSelected: (value){
              if(value == 1){
                Get.offAll(() => const HomeScreen());
              }else if(value == 2){
                AuthService.authService.signOut();
              }
            },
          )
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 60);
}
