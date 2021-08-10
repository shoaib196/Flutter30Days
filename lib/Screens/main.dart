import 'package:flutter/material.dart';
import 'package:store_app/Screens/cart_screen.dart';
import 'package:store_app/Screens/home_screen.dart';
import 'package:store_app/Screens/login_screen.dart';
import 'package:store_app/Screens/signUp_screen.dart';
import 'package:store_app/Screens/themes.dart';
import 'package:store_app/Utilities/Routes.dart';

import 'home_vx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      themeMode: ThemeMode.light,
      theme: MyThemes.themeData(context),
      darkTheme: MyThemes.darkThemeData(context),
      routes: {
        "/": (context) => HomeVX(),
        MyRoutes.signUpRoute: (context) => Signup(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.cartRoute: (context) => CartScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
