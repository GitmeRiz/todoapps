import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    colorScheme: ColorScheme.light(
      background: Color.fromRGBO(249, 249, 249, 1),
      primary: Color.fromRGBO(205, 240, 234, 1),
      secondary: Color.fromRGBO(196, 223, 223, 1),
    ));
