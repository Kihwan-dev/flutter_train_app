import 'package:flutter/material.dart';
import 'package:flutter_train_app/Models/station_list_data.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.title);

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: title, isBackOn: true),
      body: ListView.builder(
        itemCount: stationList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, stationList[index]);
            },
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[300]!,
                  ),
                ),
              ),
              child: Text(
                stationList[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
