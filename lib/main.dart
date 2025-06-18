import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // ← Changed Key to Key?

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
      child: Container(
        child: Text("welcome to 30 days of flutter"),
      ),
      ),
    );
  }
}
