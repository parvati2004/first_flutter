// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:first_flutter/utils/routes.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_header.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:velocity_x/velocity_x.dart';

import 'package:first_flutter/widgets/themes.dart';
import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    CatalogModel.items = productsData.map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
       
      floatingActionButton: FloatingActionButton(
        
        onPressed:()=>Navigator.pushNamed(context,MyRoutes.cartRoute),
       
      backgroundColor: MyTheme.darkBluishColor,
      child:Icon(CupertinoIcons.cart,color:Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              CatalogModel.items.isNotEmpty
                  ? const CatalogList().expand()
                  : const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}






