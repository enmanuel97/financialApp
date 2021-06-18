import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:savemymoney/src/pages/home_page.dart';
import 'package:savemymoney/src/pages/overview_page.dart';
import 'package:savemymoney/src/pages/profile_page.dart';
import 'package:savemymoney/src/pages/transactions_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  List<Widget> pages = [
    HomePage(),
    OverviewPage(),
    TransactionsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home,
      Icons.pie_chart_sharp,
      Icons.history,
      Icons.person
    ];

    return AnimatedBottomNavigationBar(
      activeColor: Color(0xff27DFFB),
      splashColor: Color(0xff27DFFB),
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      elevation: 0,
      activeIndex: pageIndex,
      gapLocation: GapLocation.none,
      iconSize: 30,
      onTap: (index) {
        selectedTab(index);
      },
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}