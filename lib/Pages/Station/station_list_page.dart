import 'package:flutter/material.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class StationListPage extends StatelessWidget {

  StationListPage(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: title, isBackOn: true),
    );
  }
}