import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';
import 'package:flutter_train_app/pages/seat/seat_widgets/column_label_layout.dart';
import 'package:flutter_train_app/pages/seat/seat_widgets/selectable_seat_layout.dart';
import 'package:flutter_train_app/pages/seat/seat_widgets/station_layout.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.departureStation, this.arrivalStation);

  String departureStation;
  String arrivalStation;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {

  String? selectedRow;
  String? selectedCol;

  void _onSelect(String row, String col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar("좌석 선택"),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
        height: 100,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (selectedRow == null && selectedCol == null) {
              return;
            }
            _showDialog(context);
          },
          child: Text("예매 하기"),
        ),
      ),
      body: Column(
        children: [
          StationLayout(
            widget.departureStation,
            widget.arrivalStation,
          ),
          SizedBox(height: 10),
          ColumnLabelLayout(),
          SizedBox(height: 10),
          SelectableSeatLayout(selectedRow, selectedCol, _onSelect),
        ],
      ),
    );
  }

  Future<dynamic> _showDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("예매 하시겠습니까?"),
          content: Text("좌석 : $selectedRow-$selectedCol"),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("취소"),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text(
                "확인",
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
