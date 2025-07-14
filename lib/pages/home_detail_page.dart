import 'package:first_flutter/models/catalog.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent 
      ),
      backgroundColor:context.canvasColor,
      bottomNavigationBar:   
       Container(
        color:context.cardColor,
        child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "₹${catalog.price}".text.xl4.red800.make(),
                     AddToCart(
                      catalog:catalog,
                      ).wh(20,50),
                    ],
                  ),
      ),
      body: SafeArea(
        bottom:false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.lg.color(context.accentColor).bold.make(),
                      catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                      10.heightBox,
                      "dsfgsdfhg dfgeyfgyef ggg gdh ffd".
                      text.
                      textStyle(context.captionStyle)
                      .make()
                      .p16()
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
