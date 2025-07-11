import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart'; // Required for Vx.* colors


class MyTheme {
 
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: 'Poppins',
        cardColor:Colors.black,
       canvasColor:creamColor ,
        scaffoldBackgroundColor: creamColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: darkBluishColor, brightness: Brightness.light),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
             iconTheme: IconThemeData(color:Colors.black)
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
       fontFamily: 'Poppins',
       cardColor:Colors.black,
       canvasColor:darkCreamColor ,
        scaffoldBackgroundColor: creamColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: darkBluishColor, brightness: Brightness.light),
            
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          titleTextStyle: TextStyle(color:Colors.white),
          iconTheme: IconThemeData(color:Colors.white),
          toolbarTextStyle: TextStyle(color:Colors.white),
        
        ),
      );
      static Color creamColor =  Color(0xFFF5F5F5); // Corrected hex
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor =  Color(0xFF403B58);
  static Color lightBluishColor = Vx.indigo500;
       

       

}
