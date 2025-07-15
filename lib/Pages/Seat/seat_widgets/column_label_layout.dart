import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/app_color_list.dart';

class ColumnLabelLayout extends StatelessWidget {
  const ColumnLabelLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _getColumnLabel("선택됨", AppColorList.selectedColor),
        SizedBox(width: 10),
        _getColumnLabel("선택 안 됨", isDarkMode ? AppColorList.unSelectedColorDark : AppColorList.unSelectedColorLight),
      ],
    );
  }
  
  // 선택 / 선택 안됨 레이블
  Row _getColumnLabel(String content, Color? color) {
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
}
