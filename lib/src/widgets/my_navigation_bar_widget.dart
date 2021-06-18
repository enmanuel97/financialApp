import 'package:flutter/material.dart';

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
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              iconSize: 35,
              icon: Icon(Icons.pie_chart_sharp),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              iconSize: 35,
              icon: Icon(Icons.history),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              iconSize: 35,
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   color: Colors.red,
    //   child: BottomNavigationBar(
    //     currentIndex: 1,
    //     selectedItemColor:  Color(0xff27DFFB),
    //     elevation: 12,
    //     items: <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: '',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.pie_chart_sharp),
    //         label: ''
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.history),
    //         label: ''
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: ''
    //       ),
    //     ],
    //   ),
    // );
  }
}