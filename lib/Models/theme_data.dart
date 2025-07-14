import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/app_color_list.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColorList.mainColor,
    brightness: Brightness.light,
  ),
  textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 40, color: Colors.black)),
  highlightColor: AppColorList.mainColor,
  dividerColor: Colors.grey[400],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColorList.mainColor),
      foregroundColor: WidgetStatePropertyAll(AppColorList.whiteText),
    ),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColorList.mainColor,
    brightness: Brightness.dark,
  ),
  textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 40, color: AppColorList.whiteText)),
  highlightColor: AppColorList.mainColor,
  dividerColor: Colors.grey[400],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColorList.mainColor),
      foregroundColor: WidgetStatePropertyAll(AppColorList.whiteText),
    ),
  ),
);
