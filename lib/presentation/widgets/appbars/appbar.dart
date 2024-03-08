import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.titleText, this.leadingWidget, this.titleWidget});

  final String titleText;
  final Widget? leadingWidget;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 5,
      title: titleWidget ?? Text(titleText, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      leading: leadingWidget,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.maxFinite, 60);
}
