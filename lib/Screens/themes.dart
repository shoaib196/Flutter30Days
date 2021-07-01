import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData themeData(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.green),
          textTheme: Theme.of(context).textTheme));
  static ThemeData darkThemeData(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );
}