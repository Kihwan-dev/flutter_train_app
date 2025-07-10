import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String departureStation = "선택";
  String arrivalStation = "선택";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: "기차 예매", isBackOn: false),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSeletStationBox(context, "출발역", true),
                  Container(
                    height: 50,
                    width: 2,
                    color: Colors.grey[400],
                  ),
                  getSeletStationBox(context, "도착역", false),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeatPage(departureStation, arrivalStation)));
                },
                child: Text(
                  "좌석 선택",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded getSeletStationBox(BuildContext context, String label, bool isDepatureStation) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => StationListPage(label)));
          print(result);
          setState(() {
            if (isDepatureStation) {
              departureStation = result ?? departureStation;
            } else {
              arrivalStation = result ?? arrivalStation;
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              isDepatureStation ? departureStation : arrivalStation,
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
