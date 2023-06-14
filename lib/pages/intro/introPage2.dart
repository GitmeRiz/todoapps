import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class introPage2 extends StatelessWidget {
  const introPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(153, 219, 245, 1),
      child: Center(
        child: Text("Page 2"),
      ),
    );
  }
}