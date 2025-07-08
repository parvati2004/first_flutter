import 'package:flutter/material.dart';

class MyTheme {
  static Color creamColor      = const Color(0xFFF5F5F5);
  static Color darkBluishColor = const Color(0xFF403B58);

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: creamColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: darkBluishColor, brightness: Brightness.light),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      );
}
