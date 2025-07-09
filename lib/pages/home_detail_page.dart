import 'package:first_flutter/models/catalog.dart';
import 'package:first_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({
    Key? key,
    required this.catalog,
  // ignore: unnecessary_null_comparison
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor:MyTheme.creamColor,
      body:SafeArea(
        child: Column(
          children: [
            Hero(
               tag:Key(catalog.id.toString()),
              child: Image.network(catalog.image),
              ).p32(),

              Expanded(child:VxArc(
                height:30.0,
                arcType:VxArcType.convey,
                child: Container(
                  color: Colors.red,
                ),
              ))
          ],
        )
      )
    );
  }
}
