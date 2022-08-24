import 'package:flutter/material.dart';

class MyThemeData{
  static ThemeData lightTheme =ThemeData(
    primaryColor: Color(0xff5D9CEC),
    accentColor: Color(0xffc3dbb9),
    scaffoldBackgroundColor: Color(0xffc3dbb9),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),

    ),
  );
  static ThemeData darkTheme =ThemeData(
    primaryColor: Color(0xff5D9CEC),
    accentColor: Color(0xff060E1E),
    scaffoldBackgroundColor: Color(0xff060E1E),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),

    ),
  );
}