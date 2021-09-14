import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/Models/Menu.dart';
import 'package:store_app/Screens/themes.dart';
import 'package:store_app/components/CircularDPWithCamera.dart';
import 'package:store_app/components/SettingMenu.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final userName = "UserName";
  final emailOrPhone = "0300-XXXXXXX";
  final List<Menu> SettingMenu = <Menu>[
    Menu(
        id: 1,
        desc: "10 Orders",
        image: Icons.airport_shuttle,
        name: "My Orders"),
    Menu(
        id: 2,
        desc: "Sialkot",
        image: Icons.alt_route,
        name: "Shipping Addresses"),
    Menu(
        id: 3,
        desc: "Cash on delivery",
        image: Icons.payment,
        name: "Payment Method"),
    Menu(id: 4, desc: "", image: Icons.settings, name: "Setting"),
  ];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        title: "Profile".text.medium.xl4.white.make(),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          ProfileImageWithCamera().centered(),
          userName.text.xl5.make().py(8),
          emailOrPhone.text.xl.color(MyThemes.textColor).make(),
          SizedBox(height: 24),
          Expanded(
              child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: SettingMenu.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 65,
                child: MenuWidget(menuItem: SettingMenu[index]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index == 4 ? MyThemes.logoutRedColor : Colors.white),

                // color: Colors.white),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
          )),
          Container(
            height: 65,
            width: context.screenWidth,
            color: Colors.red,
            child: "Logout".text.color(Colors.white).make(),
          )
        ],
      ),
    );
  }
}
