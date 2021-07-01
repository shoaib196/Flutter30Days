import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Models/item.dart';
import 'package:store_app/Screens/drawer.dart';
import 'package:store_app/Utilities/global.dart';

import 'item_Widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        ? ListView.builder(
            itemCount: ItemModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: ItemModel.items[index]);
            },
          )
        : CircularProgressIndicator();
  }
}
