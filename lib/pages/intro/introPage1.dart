import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class introPage1 extends StatelessWidget {
  const introPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(167, 236, 238, 1),
      child: Center(
        child: Text("Page 1"),
      ),
    );
  }
}