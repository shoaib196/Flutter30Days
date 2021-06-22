import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final days = 40;
    final user = 'Shoaib';

    return Scaffold(
      body: Center(
        child: Text("Its ${days} day flutter app serise :  $user"),
      ),
      appBar: AppBar(
        title: Text("My Store"),
      ),
      drawer: Drawer(),
    );
  }
}
