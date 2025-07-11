import 'package:first_flutter/models/catalog.dart';

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
  num get totalPrice=>
  items.fold(0,(total,current)=>total+current.price)
;
//Add Items
void add(Item item)
{
  _itemIds.add(item.id);
}
//remove Items
void remove(Item item)
{
  _itemIds.remove(item.id);
}
}