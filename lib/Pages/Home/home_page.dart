import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/app_color_list.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: BasicTitleAppBar("기차 예매"),
      backgroundColor: Theme.of(context).colorScheme.brightness == Brightness.light ? AppColorList.scaffoldBodyBgLight : Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode ? AppColorList.containerBgDark : AppColorList.containerBgLight,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _getSeletStationBox(context, "출발역", true),
                  Container(
                    height: 50,
                    width: 2,
                    color: Theme.of(context).dividerColor,
                  ),
                  _getSeletStationBox(context, "도착역", false),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (departureStation == "선택" || arrivalStation == "선택") return;
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

  Expanded _getSeletStationBox(BuildContext context, String label, bool isDepartureStation) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StationListPage(
                label,
                isDepartureStation,
                arrivalStation: arrivalStation,
                departureStation: departureStation,
              ),
            ),
          );
          setState(() {
            if (isDepartureStation) {
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
                color: AppColorList.greyText,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              isDepartureStation ? departureStation : arrivalStation,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
