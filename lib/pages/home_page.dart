// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:first_flutter/core/store.dart';
import 'package:first_flutter/utils/routes.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_header.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart as http';
import 'package:first_flutter/widgets/themes.dart';
import '../models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days=30;
  final String name="Codepur";
  final url="https://api.jsonbin.iob/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    //final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson=response.body;
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"] as List<dynamic>;

    CatalogModel.items = productsData.map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart=(VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
       
       floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: const Icon(CupertinoIcons.cart, color: Colors.white, semanticLabel: 'Cart'),
        ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart.items.length,
          textStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
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






