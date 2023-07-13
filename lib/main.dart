import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/controllerBinding.dart';
import 'package:todoapp/pages/homeScreen.dart';
import 'package:todoapp/pages/loginPage.dart';
import 'package:todoapp/pages/sidebar.dart';
import 'package:todoapp/pages/welcomePage.dart';
import 'package:todoapp/theme/darkTheme.dart';
import 'package:todoapp/theme/lightTheme.dart';

void main() async {

  //init hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      // initialBinding: ControllerBindings(),
      home: loginPage(),
    );
  }
}