import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/presentation/downloads/screen_downloads.dart';
import 'package:neflix_ui/presentation/fast_and_laughs/screen_fastandlaughs.dart';
import 'package:neflix_ui/presentation/home/screen_home.dart';
import 'package:neflix_ui/presentation/main_page/widgets/bottom_nav.dart';
import 'package:neflix_ui/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:neflix_ui/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastAndLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          }),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
