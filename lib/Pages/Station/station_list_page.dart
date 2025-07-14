import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/station_list_data.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.title, this.isDepartureStation, {this.departureStation, this.arrivalStation});

  String title;
  bool isDepartureStation;
  String? departureStation;
  String? arrivalStation;

  List<String> getStationList() => stationList.where((station) => station != (isDepartureStation ? arrivalStation : departureStation)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(title, isBackOn: true),
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
