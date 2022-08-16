import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/widgets/main_card.dart';
import 'package:neflix_ui/widgets/maintitle.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTile(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return MainCard();
              })),
        ),
      ],
    );
  }
}
