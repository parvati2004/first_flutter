// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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
    // Show a 2‑second spinner so the UI doesn’t look frozen
    await Future.delayed(const Duration(seconds: 2));

    // Read the local JSON asset
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"] as List<dynamic>;

    // Populate the global model
    CatalogModel.items =
        productsData.map((item) => Item.fromMap(item)).toList();

    setState(() {}); // Rebuild the screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,      // ✅ single comma
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              //
              // List when ready, else a loader
              //
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
        8.heightBox,
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => CatalogItem(catalog: items[index]),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image:catalog.image
          ),
          //
          // Product image
          //
         
                         // 40 % of screen width

          //
          // Product details
          //
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                 ),
              
              children: [
                catalog.name.text.lg.bold.make(),
                catalog.desc.text.bodySmall(context).make(),
                10.heightBox,
                "₹${catalog.price}".text.xl.make(),
                ElevatedButton(
                  onPressed:(){},
                  style:ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor
                  ),
                  shape:MaterialStateProperty.all(StadiumBorder())
                  
                  ),
                  child:"Buy".text.make(),
                ).pOnly(right:8.0)
         
              
              ],
             
            ),
          ),
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}


class CatalogImage extends StatelessWidget {

  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(image)
           .box
              .roundedLg
              .p16
              .color(MyTheme.creamColor) // ✅ use .color(...) before .make()
              .make()
              .p16()
              .w40(context);
  
  }
}
