import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/pages/homeScreen.dart';
import 'package:todoapp/pages/loginPage.dart';
import 'package:todoapp/pages/sidebar.dart';
import 'package:todoapp/theme/darkTheme.dart';
import 'package:todoapp/theme/lightTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Theme.of(context).colorScheme.background));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: loginPage(),
    );
  }
}