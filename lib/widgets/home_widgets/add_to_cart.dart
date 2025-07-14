import 'package:first_flutter/models/cart.dart';
import 'package:first_flutter/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class _AddToCard extends StatefulWidget {
  final Item catalog;
  const _AddToCard({super.key,required this.catalog});

  @override
  State<_AddToCard> createState() => __AddToCardState();
}

class __AddToCardState extends State<_AddToCard> {
 final _cart= CartModel();
  @override
  Widget build(BuildContext context) {
    
  bool isInCart=_cart.items.contains(widget.catalog) ?? false;
    return   ElevatedButton(
                      onPressed: () {
                       
                        if(!isInCart)
                        {
                        isInCart=isInCart.toggle();
                        final _catalog=CatalogModel();
                        
                        _cart.catalog=_catalog;
                        _cart.add(widget.catalog);
                        setState((){});
                        }

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.colorScheme.secondary),
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                      ),
                      child: isInCart?Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus),
    );
                  
  }
}