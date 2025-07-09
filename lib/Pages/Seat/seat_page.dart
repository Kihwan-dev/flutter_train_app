import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class SeatPage extends StatefulWidget {
  String departureStation;
  String arrivalStation;

  String? selectedRow;
  String? selectedCol;

  SeatPage(this.departureStation, this.arrivalStation);

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: "좌석 선택", isBackOn: true),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 50),
        height: 100,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if(widget.selectedRow == null && widget.selectedCol == null) {
              return;
            }
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("예매 하시겠습니까?"),
                  content: Text("좌석:${widget.selectedRow}-${widget.selectedCol}"),
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
          },
          child: Text("예매 하기"),
        ),
      ),
      body: Column(
        children: [
          getStationLayout(),
          SizedBox(height: 10),
          getColumnLabelLayout(),
          SizedBox(height: 10),
          getSelectableSeatLayout(),
        ],
      ),
    );
  }

  SizedBox getStationLayout() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.departureStation,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_circle_right_outlined,
            size: 30,
          ),
          Text(
            widget.arrivalStation,
            style: TextStyle(
              color: Colors.purple,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Row getColumnLabelLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getColumnLabel("선택됨", Colors.purple),
        SizedBox(width: 10),
        getColumnLabel("선택 안 됨", Colors.grey[300]!),
      ],
    );
  }

  Expanded getSelectableSeatLayout() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getColumnLabelBox("A"),
              SizedBox(width: 4),
              getColumnLabelBox("B"),
              SizedBox(width: 4),
              getColumnLabelBox(""),
              SizedBox(width: 4),
              getColumnLabelBox("C"),
              SizedBox(width: 4),
              getColumnLabelBox("D"),
            ],
          ),
          ...List.generate(
            20,
            (index) => getRowOfSelectableSeat(index + 1),
          ),
        ],
      ),
    );
  }

  Row getColumnLabel(String content, Color color) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(content),
      ],
    );
  }

  Widget getRowOfSelectableSeat(int row) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getSelectableSeat(row.toString(), "A"),
            SizedBox(width: 4),
            getSelectableSeat(row.toString(), "B"),
            SizedBox(width: 4),
            getColumnLabelBox(row.toString()),
            SizedBox(width: 4),
            getSelectableSeat(row.toString(), "C"),
            SizedBox(width: 4),
            getSelectableSeat(row.toString(), "D"),
          ],
        ),
        row < 20 ? SizedBox(height: 8) : SizedBox(),
      ],
    );
  }

  Widget getSelectableSeat(String row, String col) {
    return GestureDetector(
      onTap: () {
        print("$row$col");
        setState(() {
          widget.selectedRow = row;
          widget.selectedCol = col;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: widget.selectedCol == col && widget.selectedRow == row ? Colors.purple : Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget getColumnLabelBox(String label) {
    return SizedBox.square(
      dimension: 50,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
