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
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
                'https://cdn.discordapp.com/attachments/768289273513508906/1039700830955261952/IMG_20221024_151020.jpg'),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
          right: 15,
        )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Riz",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Riz@gmail.com",
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        )
      ],
    );
  }
}
