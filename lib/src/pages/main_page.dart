import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:savemymoney/src/providers/navigation_bar_provider.dart';
import 'package:savemymoney/src/pages/home_page.dart';
import 'package:savemymoney/src/pages/overview_page.dart';
import 'package:savemymoney/src/pages/transactions_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  List<Widget> pages = <Widget>[
    HomePage(),
    OverviewPage(),
    TransactionsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
      bottomNavigationBar: getFooter(context),
    );
  }

  Widget getBody(BuildContext context) {
    final currentPage = Provider.of<NavigationBarProvider>(context).currentPage;
    this.pageIndex = currentPage;

    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter(BuildContext context) {
    List<IconData> iconItems = [
      Icons.home,
      Icons.pie_chart_sharp,
      Icons.history,
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
        final navigationBarProvider = Provider.of<NavigationBarProvider>(context, listen: false);
        navigationBarProvider.currentPage = index;
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