
class CatalogModel{

static final items=[Item(
  id:"Codepur001",
  name:"iphone 12 pro",
  desc:"Apple iphone 12thgeneration",
  price: 999,
  color:"#33505a",
  image: "https://m.media-amazon.com/images/I/71yzJoE7WlL._SL1500_.jpg",

)];

}

class Item{
 final String id;
 final String name;
 final String desc;
 final num price;
 final String color;
 final String image;

 const Item({
  required this.id,
  required this.name,
  required this.desc,
  required this.price,
  required this.color,
  required this.image,
});
}
