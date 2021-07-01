import 'package:flutter/material.dart';
import 'package:store_app/Models/item.dart';
import 'package:store_app/Screens/drawer.dart';

import 'item_Widget.dart';

class Home extends StatelessWidget {
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
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _dummyList = List.generate(30, (index) => ItemModel.items[0]);
    return ListView.builder(
      itemCount: _dummyList.length,
      itemBuilder: (context, index) {
        return ItemWidget(item: _dummyList[index]);
      },
    );
  }
}
