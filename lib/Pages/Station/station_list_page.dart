import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/station_list_data.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.title, this.isDepatureStation, {this.depatureStation, this.arrivalStation});

  String title;
  bool isDepatureStation;
  String? depatureStation;
  String? arrivalStation;

  List<String> getStationList() {
    List<String> list = [];

    if(isDepatureStation) {
      list = stationList.where((station) => station != arrivalStation).toList();
    } else {
      list = stationList.where((station) => station != depatureStation).toList();
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: title, isBackOn: true),
      body: ListView.builder(
        itemCount: getStationList().length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, getStationList()[index]);
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
                getStationList()[index],
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
