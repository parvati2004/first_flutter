
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
 
  Widget build(BuildContext context) {
    


    
    return MaterialApp(
     themeMode:ThemeMode.light,
     theme:ThemeData(
      brightness:Brightness.light,
      primarySwatch:Colors.deepOrange,
      fontFamily:GoogleFonts.lato().fontFamily,
    
     ),
     
  
    routes: {
      "/":(context)=> LoginPage(),
       "/home":(context)=>HomePage(),
      "/login":(context)=>LoginPage()
    },
    );
  }

}
