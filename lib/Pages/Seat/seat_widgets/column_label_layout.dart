import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnLabelLayout extends StatelessWidget {
  const ColumnLabelLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getColumnLabel("선택됨", Colors.purple),
        SizedBox(width: 10),
        getColumnLabel("선택 안 됨", Colors.grey[300]!),
      ],
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
}
