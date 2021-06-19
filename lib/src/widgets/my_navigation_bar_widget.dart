import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savemymoney/src/providers/navigation_bar_provider.dart';

class MyNavigationBar extends StatelessWidget {

  final int selectedTab;
  final Color selectedColor;
  final Color unselectedColor;
  final double iconSize;

  MyNavigationBar({
    this.selectedTab = 0, 
    this.selectedColor = Colors.blue, 
    this.unselectedColor = Colors.grey, 
    this.iconSize = 35.0
  });

  @override
  Widget build(BuildContext context) {

    final navigationBarModel = Provider.of<NavigationBarProvider>(context);

    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Home',
              iconSize: this.iconSize,
              color: this.selectedColor,
              icon: Icon(Icons.home),
              onPressed: () {
                navigationBarModel.currentPage = 0;
                Navigator.pushReplacementNamed(context, 'home');
              },
            ),
            IconButton(
              tooltip: 'Search',
              iconSize: 35,
              icon: Icon(Icons.pie_chart_sharp),
              onPressed: () {
                navigationBarModel.currentPage = 1;
                Navigator.pushReplacementNamed(context, 'overview');
              },
            ),
            IconButton(
              tooltip: 'Search',
              iconSize: 35,
              icon: Icon(Icons.history),
              onPressed: () {
                navigationBarModel.currentPage = 2;
                Navigator.pushReplacementNamed(context, 'transactions');
              },
            ),
            IconButton(
              tooltip: 'Favorite',
              iconSize: 35,
              icon: Icon(Icons.person),
              onPressed: () {
                navigationBarModel.currentPage = 3;
                Navigator.pushReplacementNamed(context, 'profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}