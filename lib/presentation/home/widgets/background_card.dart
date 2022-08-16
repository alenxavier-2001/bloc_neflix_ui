import 'package:flutter/material.dart';

import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/widgets/custom_button_widget.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgurl), fit: BoxFit.cover)),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                _PlayButton(),
                CustomButtonWidget(
                  title: "Info",
                  icon: Icons.info,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 28,
          color: kBlack,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 25, color: kBlack),
          ),
        ));
  }
}
