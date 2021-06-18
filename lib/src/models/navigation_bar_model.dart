import 'package:flutter/material.dart';

class NavigationBarModel with ChangeNotifier {

  int _currentTab = 0;

  int get currentTab => this._currentTab;

  set currentTab(int index) {
    this._currentTab = index;
    notifyListeners();
  }
}