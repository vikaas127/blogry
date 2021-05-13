import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'light_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
      backgroundColor: LightColor.background,
      primaryColor: Colors.white,
      // ignore: deprecated_member_use
      cursorColor: Colors.white,
      accentColor: Colors.white,
      //primarySwatch: Colors.white,
      cardTheme: CardTheme(color: LightColor.background),
      textTheme: TextTheme(bodyText1: TextStyle(color: LightColor.black)),
      iconTheme: IconThemeData(color: LightColor.iconColor),
      bottomAppBarColor: LightColor.background,
      dividerColor: LightColor.lightGrey,
      primaryTextTheme:
      TextTheme(bodyText1: TextStyle(color: LightColor.titleTextColor)));

  static TextStyle titleStyle = GoogleFonts.roboto(color: LightColor.titleTextColor, fontSize: 15);
  static TextStyle subTitleStyle =
  const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);
  static TextStyle kTitleStyle = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      height: 1.5,
      fontFamily: "Product Sans");
  static TextStyle kTitleStylesign = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      height: 1.5,
      fontFamily: "Product Sans");

  static TextStyle h1Style =
  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
  const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}