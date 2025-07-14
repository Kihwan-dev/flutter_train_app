import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/app_color_list.dart';

class SelectableSeatLayout extends StatelessWidget {
  SelectableSeatLayout(this.selectedRow, this.selectedCol, this.onSelect);

  String? selectedRow;
  String? selectedCol;

  void Function(String row, String col) onSelect;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getColumnLabelBox("A"),
              SizedBox(width: 4),
              _getColumnLabelBox("B"),
              SizedBox(width: 4),
              _getColumnLabelBox(""),
              SizedBox(width: 4),
              _getColumnLabelBox("C"),
              SizedBox(width: 4),
              _getColumnLabelBox("D"),
            ],
          ),
          ...List.generate(
            20,
            (index) => _getRowOfSelectableSeat(context, index + 1),
          ),
        ],
      ),
    );
  }

  Widget _getRowOfSelectableSeat(BuildContext context, int row) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getSelectableSeat(context, row.toString(), "A"),
            SizedBox(width: 4),
            _getSelectableSeat(context, row.toString(), "B"),
            SizedBox(width: 4),
            _getColumnLabelBox(row.toString()),
            SizedBox(width: 4),
            _getSelectableSeat(context, row.toString(), "C"),
            SizedBox(width: 4),
            _getSelectableSeat(context, row.toString(), "D"),
          ],
        ),
        row < 20 ? SizedBox(height: 8) : SizedBox(),
      ],
    );
  }

  Widget _getSelectableSeat(BuildContext context, String row, String col) {
    final isDarkMode = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        onSelect(row, col);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: selectedCol == col && selectedRow == row
              ? AppColorList.selectedColor
              : isDarkMode
                  ? AppColorList.unSelectedColorDark
                  : AppColorList.unSelectedColorLight,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _getColumnLabelBox(String label) {
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
