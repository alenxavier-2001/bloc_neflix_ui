import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/widgets/custom_button_widget.dart';
import 'package:neflix_ui/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                    color: kGreyColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(
                  url: posterPath,
                ),
                Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        style: const TextStyle(
                          // letterSpacing: -5,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const CustomButtonWidget(
                      icon: Icons.notifications,
                      title: "Remind me",
                      iconsize: 20,
                      textsize: 12,
                    ),
                    kWidth,
                    const CustomButtonWidget(
                      icon: Icons.info,
                      title: "info",
                      iconsize: 20,
                      textsize: 12,
                    ),
                    kWidth,
                  ],
                ),
                kHeight,
                Text("Coming on $day $month"),
                kHeight,
                Text(
                  movieName,
                  style: const TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                kHeight,
                Text(
                  description,
                  style: const TextStyle(
                      color: kGreyColor, overflow: TextOverflow.clip),
                ),
              ],
            ),
          ),
        ),
        kWidth
      ],
    );
  }
}
