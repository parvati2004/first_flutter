
import 'package:first_flutter/models/catalog.dart';
import 'package:first_flutter/pages/home_detail_page.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_image.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final catalog=CatalogModel.items[index];
        return InkWell(
          onTap:()=>
          Navigator.push(context, 
          MaterialPageRoute(builder:(context)
          =>HomeDetailPage(catalog: catalog))),
          child: CatalogItem(catalog:catalog));
      }
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
          Hero(
            tag:Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ // ✅ FIX: This was outside the Column!
                  catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.bodySmall(context).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                  
                    "₹${catalog.price}".text.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.secondary),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      child: "Add to cart".text.make(),
                    ).pOnly(right: 8.0),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).roundedLg.height(150).make().py16();

  }
}