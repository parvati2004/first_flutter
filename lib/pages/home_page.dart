import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../models/catalog.dart';
import '../widgets/item_widget.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double days = 30.1;
  final String name = "Parvati";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"] as List<dynamic>;

    CatalogModel.items =
        productsData.map((item) => Item.fromMap(item)).toList();
    setState(() {}); // Rebuild UI now that data is ready
  }

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;

    return Scaffold(
      appBar: AppBar(title: const Text("Catalog App")),
      body: Padding(
        padding: EdgeInsets.all(11.0),
        child: items.isNotEmpty
            ? GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount:3,
                 mainAxisSpacing:20, 
                 crossAxisSpacing: 16,
                 ),
           
             itemBuilder:(context,index){
              final item=CatalogModel.items[index];
              return Card(
                clipBehavior:Clip.antiAlias ,
                shape:  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(15)),
                child: GridTile(
                  header: Container(child: Text(item.name,style:TextStyle(color:Colors.white),),
                  width:100.0,
                  padding: const EdgeInsets.all(12),
                  decoration:BoxDecoration(
                    color:Colors.deepPurple,
                  ),

                  ),
                  child:Image.network(item.image,fit:BoxFit.contain),
                  
                  footer:Container(
                    child: Text
                    (item.price.toString(),style:TextStyle(color:Colors.white),),
                  width:100.0,
                  padding: const EdgeInsets.all(12),
                  decoration:BoxDecoration(
                    color:Colors.black,
                  ),

                  ),
              ));
             } ,
             itemCount: CatalogModel.items.length,
             )
            : Center(child: CircularProgressIndicator()),
      ),
      drawer: MyDrawer(),
    );
  }
}
