import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Models/item.dart';
import 'package:store_app/Screens/catalog_details.dart';
import 'package:store_app/Utilities/global.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeVX extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeVX> {
  final days = 40;
  final user = 'Shoaib';
  int curentIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: "Super Store".text.xl4.color(context.theme.canvasColor).make(),
        backgroundColor: context.theme.backgroundColor,
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.mH16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CatalogHeader(),
              if (ItemModel.items != null && ItemModel.items.isNotEmpty)
                CatalogList().expand()
              else
                CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }

//region method
  getData()
  //*****************************************************
  async {
    await Future.delayed(Duration(seconds: 5));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var itemList = decodedData["products"];
    ItemModel.items =
        List.from(itemList).map<Item>((item) => Item.fromJson(item)).toList();
    setState(() {});
  }
//endregion
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ItemModel.items.count(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final catalog = ItemModel.items[index];
          return InkWell(
              child: CatalogItem(catalog: catalog),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CatalogDetails(catalog: catalog)));
              });
        },
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog Home".text.xl5.bold.color(Colors.grey.shade700).make(),
        SizedBox(height: 8),
        "Trending".text.xl3.bold.color(Colors.green.shade400).make()
      ],
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            catalog: catalog,
          ),
        ),
        Expanded(
            // flex: 1,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            catalog.name.text.lg.bold.gray700.make(),
            catalog.desc.text.overflow(TextOverflow.ellipsis).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${catalog.price.toString()}".text.xl2.make(),
                ElevatedButton(
                    onPressed: () {},
                    child: "Buy".text.make(),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red.shade300),
                        shape: MaterialStateProperty.all(StadiumBorder())))
              ],
            )
          ],
        ).py16().px(8))
      ],
    )).red100.roundedSM.px16.make().py8();
  }
}

class CatalogImage extends StatelessWidget {
  final Item catalog;

  const CatalogImage({Key key, @required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image)
        .box
        .p12
        .white
        .roundedSM
        .make()
        .w32(context)
        .py(12);
  }
}
