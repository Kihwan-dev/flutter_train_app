import 'package:flutter/material.dart';
import 'package:flutter_train_app/Widgets/basic_title_appbar.dart';

class SeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicTitleAppBar(appBarTitleText: "좌석 선택", isBackOn: true),
      bottomNavigationBar: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text("예매 하기"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 266,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "수서",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 30,
                ),
                Spacer(),
                Text(
                  "부산",
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 4),
              Text("선택됨"),
              SizedBox(width: 10),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(width: 4),
              Text("선택 안 됨"),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
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
                  (index) => getSelectBoxRow(index + 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column getSelectBoxRow(int num) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getSelectSeatBox(num.toString(), "A"),
            SizedBox(width: 4),
            getSelectSeatBox(num.toString(), "B"),
            SizedBox(width: 4),
            SizedBox(
              width: 50,
              height: 50,
              child: Center(
                child: Text(
                  num.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4),
            getSelectSeatBox(num.toString(), "C"),
            SizedBox(width: 4),
            getSelectSeatBox(num.toString(), "D"),
          ],
        ),
        num < 20 ? SizedBox(height: 8) : SizedBox(),
      ],
    );
  }

  GestureDetector getSelectSeatBox(String row, String col) {
    return GestureDetector(
      onTap: () {
        print("$row$col");
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  SizedBox getColumnLabelBox(String label) {
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
