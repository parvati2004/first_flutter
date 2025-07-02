
import 'package:first_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

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
     theme:MyTheme.LightTheme(context),
    
     darkTheme:MyTheme.darkTheme(context),
     
     debugShowCheckedModeBanner: false,
     initialRoute:MyRoutes.homeRoute,
  
    routes: {
      "/":(context)=> LoginPage(),
       MyRoutes.homeRoute:(context)=>HomePage(),
       MyRoutes.loginRoute:(context)=>LoginPage()
    },
    );
  }

}
