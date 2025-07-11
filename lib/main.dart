import 'package:first_flutter/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ── Theme settings
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),   // ← lowercase ‘l’
      darkTheme: MyTheme.darkTheme(context),

      // ── Routing
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute:  (context) =>  HomePage(),
        MyRoutes.cartRoute:  (context) =>  CartPage(),
      },
    );
  }
}
