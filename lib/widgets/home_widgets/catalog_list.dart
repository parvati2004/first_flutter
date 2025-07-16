
import 'package:first_flutter/models/catalog.dart';

import 'package:first_flutter/utils/routes.dart';
import 'package:first_flutter/widgets/home_widgets/add_to_cart.dart';
import 'package:first_flutter/widgets/home_widgets/catalog_image.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = CatalogModel.items;

    return context.isMobile
        ? ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final catalog = items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                    path: MyRoutes.homeDetailRoute,
                    queryParameters: {"id": catalog.id.toString()},
                  ),
                  params: catalog,
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 150, // Ensures consistent height
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final catalog = items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                    path: MyRoutes.homeDetailRoute,
                    queryParameters: {"id": catalog.id.toString()},
                  ),
                  params: catalog,
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          );
  }
}



class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog}):assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    var children = [
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
                    "\$${catalog.price}".text.xl.make(),
                    AddToCart(catalog:catalog),
                  ],
            
                  
                ).pOnly(right:8.0),
              ],
            ).p(context.isMobile?0:16),
          ),
        ];
    return VxBox(
      child: context.isMobile? Row(
        children: children,
      ):Column( children: children),
    ).color(context.cardColor).roundedLg.height(150).make().py16();

  }
}
