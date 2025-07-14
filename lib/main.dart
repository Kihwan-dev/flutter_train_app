import 'package:flutter/material.dart';
import 'package:flutter_train_app/models/theme_data.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(),
    );
  }
}
