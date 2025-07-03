import 'package:first_flutter/models/catalog.dart';
import 'package:first_flutter/widgets/item_widget.dart';
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
       body:Padding(
         padding: const EdgeInsets.all(11.0),
         child: ListView.builder(
         
          itemCount:CatalogModel.items.length,
          itemBuilder:(context,index){
            return ItemWidget(item:CatalogModel.items[index],
            );
          } ,
         ),
       ),
      drawer:MyDrawer(),//menu var click kela ki drawers yeil

    );
  }
}


