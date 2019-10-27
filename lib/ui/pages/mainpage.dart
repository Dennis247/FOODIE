import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/about.dart';
import 'package:foodie/ui/pages/historypage.dart';
import 'package:foodie/ui/widgets/bottom_nav_bar.dart';
import 'homepage.dart';
import 'order/orderpage.dart';

class MainPage extends StatefulWidget {
  static String routeName = "MainPage";
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        children: <Widget>[
          HomePage(),
          OrderPage(),
          HistoryPage(),
          AboutPage(),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
          initialData: 0,
          stream: indexcontroller.stream,
          builder: (context, snapshot) {
            int cIndex = snapshot.data;
            return FancyBottomNavigation(
              currentIndex: cIndex,
              items: <FancyBottomNavigationItem>[
                FancyBottomNavigationItem(
                    icon: Icon(Icons.home), title: Text('Home')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.add_shopping_cart), title: Text('Orders')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.history), title: Text('History')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.info), title: Text('About')),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            );
          }),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();

    // _pageController.dispose();
  }
}
