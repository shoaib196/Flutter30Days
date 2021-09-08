import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/Screens/Categories.dart';
import 'package:store_app/Screens/Profile.dart';
import 'package:store_app/Screens/home_vx.dart';
import 'package:store_app/Utilities/Routes.dart';

import 'cart_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex;

  List<Widget> screenList = <Widget>[
    HomeVX(),
    Categories(),
    CartScreen(),
    Profile()
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    currentIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(CupertinoIcons.cart_fill_badge_plus),
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.category_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.category,
                color: Colors.deepPurple,
              ),
              title: Text("Categories")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.list,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.view_list,
                color: Colors.indigo,
              ),
              title: Text("Wish List")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: Colors.green,
              ),
              title: Text("Profile"))
        ],
      ),
      body: screenList[currentIndex],
    );
  }
}
