import 'package:flutter/material.dart';
import 'package:todoapp/widgets/buttonSave.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

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
                  border: OutlineInputBorder(), hintText: "Add a new task!"),
            ),

            // cancel and save
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                buttonSave(text: "Save", onPressed: onSave),
                SizedBox(
                  width: 8,
                ),
                buttonSave(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
