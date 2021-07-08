import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Models/item.dart';
import 'package:store_app/Screens/drawer.dart';
import 'package:store_app/Utilities/global.dart';

class HomeGrid extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeGrid> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final days = 40;
    final user = 'Shoaib';  

    return Scaffold(
      body: Center(
        child: ItemList(),
      ),
      appBar: AppBar(
        title: Text("My Store"),
      ),
      drawer: MyDrawer(),
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

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemModel.items.length != null && ItemModel.items.isNotEmpty
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemCount: ItemModel.items.length,
            itemBuilder: (context, index) {
              Item p = ItemModel.items[index];
              return Card(
                  margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                      header: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.green,
                          child: Text(
                            p.name,
                            style: TextStyle(color: Colors.white),
                          )),
                      footer: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.green,
                          child: Text(
                            p.price.toString(),
                            style: TextStyle(color: Colors.white),
                          )),
                      child: Image.network(
                        p.image,
                        width: 10,
                        height: 10,
                      )));
            },
          )
        : CircularProgressIndicator();
  }
}
