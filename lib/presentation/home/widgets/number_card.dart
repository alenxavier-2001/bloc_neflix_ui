import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Container(
                width: 130,
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: kRadius20,
                    image: const DecorationImage(
                        image: NetworkImage(imgurl), fit: BoxFit.cover)),
              ),
            ],
          ),
          Positioned(
            left: 12,
            bottom: 2,
            child: BorderedText(
              strokeWidth: 5,
              strokeColor: kWhite,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                    fontSize: 130,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
