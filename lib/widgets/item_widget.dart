import 'package:first_flutter/models/catalog.dart';
import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {


final Item item;

  const ItemWidget({super.key, required this.item})
  : assert(item!=null);
 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Image.network(item.image),
      title:Text(item.name),
      subtitle:Text(item.desc),
      trailing:Text("\$${item.price}") ,

    );
  }
}