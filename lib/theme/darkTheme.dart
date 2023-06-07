import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    colorScheme: const ColorScheme.dark(
      background: Color.fromRGBO(49, 49, 49, 1),
      primary: Color.fromRGBO(65, 65, 65, 1),
      secondary: Color.fromRGBO(82, 82, 82, 1),
    ));
