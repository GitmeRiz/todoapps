import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class buttonSave extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  buttonSave({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      child: Text(text),
    );
  }
}
