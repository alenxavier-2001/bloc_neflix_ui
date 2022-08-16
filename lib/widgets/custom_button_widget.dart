import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconsize;
  final double textsize;
  const CustomButtonWidget(
      {Key? key,
      this.iconsize = 30,
      this.textsize = 18,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconsize,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: textsize,
          ),
        ),
      ],
    );
  }
}
