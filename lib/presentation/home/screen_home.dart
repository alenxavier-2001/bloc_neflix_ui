import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/home/widgets/background_card.dart';
import 'package:neflix_ui/widgets/custom_button_widget.dart';

import 'package:neflix_ui/presentation/home/widgets/number_title_card.dart';

import 'package:neflix_ui/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: scrollNotifier,
              builder: (context, value, _) {
                return NotificationListener<UserScrollNotification>(
                  onNotification: (notification) {
                    final ScrollDirection direction = notification.direction;

                    if (direction == ScrollDirection.reverse) {
                      scrollNotifier.value = false;
                    } else if (direction == ScrollDirection.forward) {
                      scrollNotifier.value = true;
                    }

                    return true;
                  },
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          BackgroundCard(),
                          MainTitleCard(
                            title: "Released in the past year",
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "Trending Now",
                          ),
                          kHeight,
                          NumberTitleCard(),
                          kHeight,
                          MainTitleCard(
                            title: "Tense Dramas",
                          ),
                          kHeight,
                          MainTitleCard(
                            title: "South Indian Movies",
                          ),
                        ],
                      ),
                      scrollNotifier.value
                          ? AnimatedContainer(
                              duration: const Duration(microseconds: 1000),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                color: Colors.black.withOpacity(0.3),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          'https://yt3.ggpht.com/ytc/AMLnZu_BbFBgOXOLYcY994jDQ-LXbeH3rVv_mW9LeSmljA=s900-c-k-c0x00ffffff-no-rj',
                                          width: 60,
                                          height: 60,
                                        ),
                                        const Spacer(),
                                        const Icon(
                                          Icons.cast,
                                          size: 30,
                                          color: Colors.white,
                                        ),
                                        kWidth,
                                        Container(
                                          height: 30,
                                          width: 30,
                                          color: Colors.blue,
                                        ),
                                        kWidth
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("TV Shows",
                                            style: kHomeTitleStyle),
                                        Text("Movies", style: kHomeTitleStyle),
                                        Text("Category",
                                            style: kHomeTitleStyle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : kHeight,
                    ],
                  ),
                );
              })),
    );
  }
}
