
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
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
     debugShowCheckedModeBanner: false,
  
    routes: {
      "/":(context)=> LoginPage(),
       MyRoutes.homeRoute:(context)=>HomePage(),
       MyRoutes.loginRoute:(context)=>LoginPage()
    },
    );
  }

}
