import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neflix_ui/application/downloads/downloads_bloc.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBarWidget(title: "Downloads"),
          ),
          body: ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return _widgetList[index];
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 25,
                );
              },
              itemCount: _widgetList.length)),
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: kbuttonColorBlue,
            onPressed: () {},
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: kbuttonColorWhite,
          onPressed: () {},
          child: const Text(
            "See what you can download",
            style: TextStyle(
                color: kBlack, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });

    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          style: TextStyle(
              color: kWhite, fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you, so there is\nalways for your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        kHeight,
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading || (state.downloads.isEmpty)
                  ? const CircularProgressIndicator()
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                            child: CircleAvatar(
                          radius: size.width * 0.6,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                        )),
                        DownloadsImageWidget(
                          imageList:
                              "$imageAppendUrl${state.downloads[0].posterPath}",
                          size: Size(size.width * 0.5, size.height * 0.35),
                          angle: 20,
                          margin: const EdgeInsets.only(
                            left: 140,
                            top: 20,
                          ),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              "$imageAppendUrl${state.downloads[1].posterPath}",
                          angle: -20,
                          size: Size(size.width * 0.5, size.height * 0.35),
                          margin: const EdgeInsets.only(
                            top: 20,
                            right: 140,
                          ),
                        ),
                        DownloadsImageWidget(
                          imageList:
                              "$imageAppendUrl${state.downloads[2].posterPath}",
                          size: Size(size.width * 0.55, size.height * 0.4),
                          margin: const EdgeInsets.only(
                            bottom: 10,
                            top: 20,
                          ),
                          angle: 0,
                        )
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.imageList,
      required this.size,
      this.angle = 20,
      required this.margin})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageList), fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
