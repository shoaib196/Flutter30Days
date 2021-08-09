import 'package:flutter/material.dart';
import 'package:store_app/Models/item.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogDetails extends StatelessWidget {
  final Item catalog;

  const CatalogDetails({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price.toString()}"
              .text
              .xl5
              .color(Colors.red.shade800)
              .make(),
          ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade300),
                      shape: MaterialStateProperty.all(StadiumBorder())))
              .w(100)
        ],
      ).p32(),
      body: SafeArea(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                  tag: Key(catalog.id.toString()),
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.network(
                      catalog.image,
                      fit: BoxFit.fitWidth,
                    ),
                  )).h32(context),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.lightGreen,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      catalog.name.text.xl4.bold.make(),
                      catalog.desc.text.xl.medium.make().px24()
                    ],
                  ).py(64),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
