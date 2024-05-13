//? StatefulWidget'da konstruktor yaratish
//? Navigation Bar
//? Sahifalarga ma'lumot yuborish
//? TabBar widget
//? FittedBox
//? Scaffold'ga rasm qo'yish

import 'package:flutter/material.dart';
import 'package:lesson34/pages/audio_player_page.dart';
import 'package:lesson34/pages/home_page.dart';
import 'package:lesson34/pages/second_page.dart';
import 'package:lesson34/pages/thrid_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  void toggleThemeMode() {
    if (themeMode == ThemeMode.system || themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     titleTextStyle: TextStyle(
      //       color: Colors.blue,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
      // darkTheme: ThemeData.dark().copyWith(
      //   appBarTheme: const AppBarTheme(
      //     titleTextStyle: TextStyle(
      //       color: Colors.yellow,
      //       fontSize: 20,
      //     ),
      //   ),
      //   textTheme: const TextTheme(),
      //   colorScheme: const ColorScheme.dark(
      //     primary: Colors.yellow,
      //   ),
      // ),
      home: const AudioPlayerPage(),
    );
  }
}
