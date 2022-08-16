import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String url;
  const VideoWidget({
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.network(
              url,
              fit: BoxFit.cover,
            )),
        Positioned(
          bottom: 1,
          right: 10,
          child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    size: 20,
                    color: kWhite,
                  ))),
        ),
      ],
    );
  }
}
