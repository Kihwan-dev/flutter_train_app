import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/theme_data.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  List<bool> isSelected = [true, false];

  void onPressed(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == index;
      }
      themeMode = index == 0 ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      themeMode: themeMode,
      // themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(
        onPressed: onPressed,
        isSelected: isSelected,
      ),
    );
  }
}
