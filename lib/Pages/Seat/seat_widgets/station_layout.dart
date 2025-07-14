import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/app_color_list.dart';

class StationLayout extends StatelessWidget {

  StationLayout(this.departureStation, this.arrivalStation);

  String departureStation;
  String arrivalStation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            departureStation,
            style: TextStyle(
              color: AppColorList.mainColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
          ),
          Text(
            arrivalStation,
            style: TextStyle(
              color: AppColorList.mainColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}