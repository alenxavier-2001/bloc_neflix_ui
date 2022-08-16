import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/home/widgets/number_card.dart';
import 'package:neflix_ui/widgets/maintitle.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTile(title: "Top 10 TV Shows In india Today"),
        kHeight,
        LimitedBox(
          maxHeight: 250,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return NumberCard(
                  index: index,
                );
              })),
        ),
      ],
    );
  }
}
