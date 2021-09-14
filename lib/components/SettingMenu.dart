import 'package:flutter/material.dart';
import 'package:store_app/Models/Menu.dart';
import 'package:velocity_x/velocity_x.dart';

class MenuWidget extends StatelessWidget {
  final Menu menuItem;

  const MenuWidget({Key key, @required this.menuItem})
      : assert(menuItem != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(menuItem.image),
      title: menuItem.name.text.make(),
      subtitle: menuItem.desc.text.make(),
    );
    ;
  }
}
