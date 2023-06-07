import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;

  Setting({
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
    title: "Change Password",
    route: "/",
    icon: Icons.settings,
  ),
];

final List<Setting> settings2 = [
  Setting(
    title: "How to Use App",
    route: "/",
    icon: CupertinoIcons.question,
  ),
  Setting(
    title: "Feedback",
    route: "/",
    icon: Icons.feedback,
  ),
];