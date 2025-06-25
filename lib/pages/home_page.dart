import "package:flutter/material.dart";



class HomePage extends StatelessWidget{
    final double days=30.1;
    final  String name="Parvati";


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title:Text("Catalog App"),
      ),
       body: Center(
      child: Container(
        child: Text("welcome to $days days of flutter $name"),
      ),
       ),
      drawer:Drawer(),//menu var click kela ki drawers yeil

    );
  }
}


