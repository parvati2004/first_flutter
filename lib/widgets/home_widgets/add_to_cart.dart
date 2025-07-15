import 'package:first_flutter/core/store.dart';
import 'package:first_flutter/models/cart.dart';
import 'package:first_flutter/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';




class AddToCart extends StatelessWidget {

  final Item catalog;
  const  AddToCart({super.key,required this.catalog});


  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[AddMutation,RemoveMutation]);
    final CartModel _cart=(VxState.store as MyStore).cart;
  bool isInCart=_cart.items.contains(catalog) ?? false;
    return   ElevatedButton(
                      onPressed: () {
                       
                        if(!isInCart)
                        {

                       AddMutation(catalog);
   
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