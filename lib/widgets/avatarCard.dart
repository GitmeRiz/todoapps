import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class avatarCard extends StatelessWidget {
  const avatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            child: ClipRRect(
              child: Image.asset('assets/images/LoginScreenLogo.png')
            ),
          ),
        ),
      ],
    );
  }
}
