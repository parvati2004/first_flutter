import 'package:first_flutter/core/store.dart';
import 'package:first_flutter/pages/cart_page.dart';
import 'package:first_flutter/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'widgets/themes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'utils/routes.dart';
import
import 'package:url_strategy/url_strategy.dart';

void main() {
  runApp(VxState(
    setPathUrlStrategy();
    store: MyStore(),
    child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // ── Theme settings
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),   // ← lowercase ‘l’
      darkTheme: MyTheme.darkTheme(context),

      routeInformationParser: VxInformationParser(),
      routerDelegate:VxNavigator(
        routes: {
        "/": (_,_) =>MaterialPage(child: LoginPage()),
        MyRoutes.loginRoute: (_,_) =>  MaterialPage(child: LoginPage()),
         MyRoutes.homeDetailRoute: (uri,_) {
          final catalog=(VxState.store as MyStore).catalog.getById(int.parse(uri.queryParameters["id"]));
           return MaterialPage(child: HomeDetailPage(catalog:catalog));
         },
        MyRoutes.homeRoute:  (_,_) =>  MaterialPage(child: HomePage()),
        MyRoutes.cartRoute:  (_,_) =>  MaterialPage(child: CartPage()),
      
   } ),



      
      // ── Routing
     // initialRoute: MyRoutes.homeRoute,
      
    );
  }
}
