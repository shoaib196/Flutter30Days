import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/Models/item.dart';
import 'package:store_app/Utilities/global.dart';

import 'catalog_details.dart';
import 'home_vx.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ItemModel.items.length,
        // itemCount: ItemModel.items.count(),
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
}
