import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
      floatingActionButton: _AddTransactionsButton(),
      bottomNavigationBar: _MyNavBars(),
    );
  }

  FloatingActionButton _AddTransactionsButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget _MyNavBars() {
    return Container(
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_sharp),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ''
          ),
        ],
      ),
    );
  }
}