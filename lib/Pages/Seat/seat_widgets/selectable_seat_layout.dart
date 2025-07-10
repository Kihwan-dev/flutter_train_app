import 'package:flutter/material.dart';

class SelectableSeatLayout extends StatelessWidget {
  SelectableSeatLayout(this.selectedRow, this.selectedCol, this.selectSeat);

  String? selectedRow;
  String? selectedCol;

  void Function(String row, String col) selectSeat;

  @override
  Widget build(BuildContext context) {
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
        selectSeat(row, col);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selectedCol == col && selectedRow == row ? Colors.purple : Colors.grey[300],
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