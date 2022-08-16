import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidgets extends StatelessWidget {
  const BottomNavigationWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int newIndex, _) {
          return BottomNavigationBar(
              onTap: ((indexvalue) {
                indexChangeNotifier.value = indexvalue;
              }),
              currentIndex: newIndex,
              elevation: 0,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: const IconThemeData(color: Colors.white),
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_emotions), label: "New & Hot"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.featured_play_list), label: "Fast Laughs"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: "Downloads"),
              ]);
        });
  }
}
