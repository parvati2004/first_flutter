import 'package:first_flutter/models/catalog.dart';
import 'package:flutter/material.dart';
class ItemWidget extends StatelessWidget {


final Item item;

 
  const ItemWidget({
    Key? key,          // explicit Key param for older & newer SDKs
    required this.item // non‑nullable, so it can never be null
  }) : super(key: key); // hand the key up to StatelessWidget

  @override
  Widget build(BuildContext context) {
    return Card(
      
    
      child: ListTile(
         onTap:(){
          print("${item.name}pressed");

     },
        leading:Image.network(item.image),
        title:Text(item.name),
        subtitle:Text(item.desc),
        trailing:Text("\$${item.price}",
        textScaleFactor: 1.9,
        style:TextStyle(
          color:Colors.deepPurple,
          fontWeight:FontWeight.bold,
        ),
        ) ,
      
      ),
    );
  }
}