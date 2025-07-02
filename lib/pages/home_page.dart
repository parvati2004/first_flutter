import "package:flutter/material.dart";
import 'package:first_flutter/widgets/drawer.dart';



class HomePage extends StatelessWidget{
    final double days=30.1;
    final  String name="Parvati";


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        // backgroundColor: Colors.white,
        // elevation:0.0,
        // iconTheme:IconThemeData(color:Colors.black),

        title:Text("Catalog App"),
      ),
       body: Center(
      child: Container(
        child: Text("welcome to $days days of flutter $name"),
      ),
       ),
      drawer:MyDrawer(),//menu var click kela ki drawers yeil

    );
  }
}


