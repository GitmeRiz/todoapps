import 'package:flutter/material.dart';
import 'package:todoapp/widgets/buttonSave.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/editTask.dart';

class EditDialogBox extends StatelessWidget {
  final controller;
  VoidCallback onEdit;
  VoidCallback onCancelEdit;
  EditDialogBox(
      {super.key,
      required this.controller,
      required this.onEdit,
      required this.onCancelEdit,
      });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              // user input
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Edit your task!"),
            ),

            // cancel and save
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buttonSave(text: "Save", onPressed: onEdit),
                SizedBox(
                  width: 8,
                ),
                buttonSave(text: "Cancel", onPressed: onCancelEdit)
              ],
            )
          ],
        ),
      ),
    );
  }
}
