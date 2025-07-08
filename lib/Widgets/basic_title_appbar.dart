import 'package:flutter/material.dart';

class BasicTitleAppBar extends StatelessWidget implements PreferredSizeWidget{

  BasicTitleAppBar({required this.appBarTitleText, required this.isBackOn});

  String appBarTitleText;
  bool isBackOn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitleText),
      centerTitle: true,
      automaticallyImplyLeading: isBackOn,
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}