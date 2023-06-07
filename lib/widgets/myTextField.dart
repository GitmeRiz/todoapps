import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const myTextField(
      {super.key,
      this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.background), // border not clicked
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)), //border clicked 
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
            hintText: hintText),
      ),
    );
  }
}