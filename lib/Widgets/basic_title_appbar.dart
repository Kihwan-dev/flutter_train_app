import 'package:flutter/material.dart';

class BasicTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  BasicTitleAppBar(this.appBarTitleText, {this.isBackOn = false, this.actions});

  String appBarTitleText;
  bool isBackOn;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarTitleText),
      centerTitle: true,
      automaticallyImplyLeading: isBackOn,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
