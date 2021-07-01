class Item {
  final int id;
  final String desc;
  final String imageUrl;
  final String name;
  final int price;

  Item({this.id, this.desc, this.imageUrl, this.name, this.price});
}

class ItemModel {
  static final items = [
    Item(
      id: 34,
      desc:
          "This is a latest model released by apple on september 2020,highly recommended for apple lover",
      imageUrl:
          "https://www.filmibeat.com/ph-big/2020/02/v-2020_158253142110.jpg",
      name: "Iphone 12pro max",
      price: 1500,
    )
  ];
}
