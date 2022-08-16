import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/widgets/custom_button_widget.dart';
import 'package:neflix_ui/widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String id;

  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget(
      {super.key,
      required this.id,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          style: const TextStyle(
              letterSpacing: 1, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          description,
          style: const TextStyle(color: kGreyColor),
        ),
        kHeight50,
        VideoWidget(
          url: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
                iconsize: 25, textsize: 16, icon: Icons.share, title: "share"),
            kWidth,
            CustomButtonWidget(
                iconsize: 25, textsize: 16, icon: Icons.add, title: "My List"),
            kWidth,
            CustomButtonWidget(
                iconsize: 25,
                textsize: 16,
                icon: Icons.play_arrow,
                title: "play"),
            kWidth,
          ],
        )
      ],
    );
  }
}
