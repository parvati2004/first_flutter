import 'package:first_flutter/core/store.dart';
import 'package:first_flutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
 


  //catalog field
 CatalogModel _catalog;

//Collection of id store all ids
  final  List<int> _itemIds=[];
  //Get Catalog
  CatalogModel get catalog=> _catalog;
  set catalog(CatalogModel newCatalog)
  {
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }
  //Get Items in the card
  List<Item> get items=>_itemIds.map((id)=>_catalog.getById(id)).toList();

  //Get total price
  num get totalPrice=>items.fold(0,(total,current)=>total+current.price)
;


}


class AddMutation extends VxMutation <MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id );
    
  }
  
}



class RemoveMutation extends VxMutation <MyStore>{
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id );
    
  }
  
}