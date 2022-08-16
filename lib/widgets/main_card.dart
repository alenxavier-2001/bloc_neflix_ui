import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: kRadius10,
          image: const DecorationImage(
              image: NetworkImage(imgurl), fit: BoxFit.cover)),
    );
  }
}
