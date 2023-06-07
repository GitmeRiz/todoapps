import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/setting.dart';


class SettingTile extends StatelessWidget {
  final Setting setting;
  const SettingTile({
    super.key,
    required this.setting,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Setting Clicked!");
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(setting.icon, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Text(
            setting.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Icon(
            CupertinoIcons.chevron_forward,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}