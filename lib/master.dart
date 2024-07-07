

import 'package:accounting/features/quiz/presentation/screens/quizhome.dart';

import 'package:flutter/material.dart';

import 'features/bookmark/presentation/screens/bookmark.dart';
import 'features/home/presentation/screens/home.dart';
import 'features/settings/presentation/screens/settings.dart';

class Master extends StatefulWidget {
  const Master({super.key});

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  final pageController = PageController(initialPage: 0);
  int currentindex = 01;

  changeIndex(int index){
    setState(() {
      currentindex = index;
      pageController.animateToPage(index, duration: Duration(microseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Home(),
      QuizHome(),
      BookMark(),
      Settings()
    ];

    return Scaffold(
      body: PageView(

          controller: pageController,
          onPageChanged: changeIndex,
          children: screens
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          type: BottomNavigationBarType.fixed,
          iconSize: 27.5,
          items:  const [
            BottomNavigationBarItem(
           ///   activeIcon: Icon(Icons.home_max),
              icon: Icon(Icons.home_filled),

              label: 'Home',

            ),
             BottomNavigationBarItem(
             // activeIcon: Icon(Icons.inventory_2_sharp),
              icon: Icon(Icons.quiz_outlined),
              label: 'Quiz',
            ),
            BottomNavigationBarItem(
            //  activeIcon: Icon(Icons.leaderboard_rounded),
              icon: Icon(Icons.bookmark_border),
              label: 'Bookmark',

            ),

            BottomNavigationBarItem(
            //  activeIcon: Icon(Icons.menu_rounded),
              icon: Icon(Icons.settings),
              label: 'Settings',

            ),
          ],
          onTap: changeIndex,
        )


    );
  }
}
