import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store_app/Screens/home_screen.dart';
import 'package:store_app/Screens/login_screen.dart';
import 'package:store_app/Screens/signUp_screen.dart';
import 'package:store_app/Utilities/Routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: GoogleFonts.lato().fontFamily),

      darkTheme: ThemeData(primarySwatch: Colors.orange),
      routes: {
        "/": (context) => Login(),
        MyRoutes.signUpRoute: (context) => Signup(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => Home()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
