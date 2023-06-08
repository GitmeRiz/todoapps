import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:todoapp/pages/homeScreen.dart';
import 'package:todoapp/pages/settingPage.dart';

class sidebar extends StatefulWidget {
  const sidebar({super.key});

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  List<ScreenHiddenDrawer> _page = [];

  final sidebarTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _page = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Home', baseStyle: sidebarTextStyle, selectedStyle: sidebarTextStyle),
          homeScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Settings',
              baseStyle: sidebarTextStyle,
              selectedStyle: sidebarTextStyle),
          settingPage()),
          // ScreenHiddenDrawer(
          // ItemHiddenMenu(
          //     name: 'Logout',
          //     baseStyle: sidebarTextStyle,
          //     selectedStyle: sidebarTextStyle),
          // Logout())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorAppBar: Theme.of(context).colorScheme.primary,
      elevationAppBar: 0,
      isDraggable: true,
      disableAppBarDefault: true,
      backgroundColorMenu: Theme.of(context).colorScheme.secondary,
      screens: _page,
      initPositionSelected: 0,
    );
  }
}
